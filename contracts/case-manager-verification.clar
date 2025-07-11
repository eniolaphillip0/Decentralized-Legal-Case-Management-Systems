;; Case Manager Verification Contract
;; Validates and manages legal case managers

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-already-verified (err u101))
(define-constant err-not-verified (err u102))
(define-constant err-invalid-manager (err u103))

;; Data structures
(define-map verified-managers principal bool)
(define-map manager-details principal {
    name: (string-ascii 100),
    license-number: (string-ascii 50),
    jurisdiction: (string-ascii 50),
    verified-at: uint
})

;; Read-only functions
(define-read-only (is-verified-manager (manager principal))
    (default-to false (map-get? verified-managers manager))
)

(define-read-only (get-manager-details (manager principal))
    (map-get? manager-details manager)
)

;; Public functions
(define-public (verify-manager (manager principal) (name (string-ascii 100)) (license-number (string-ascii 50)) (jurisdiction (string-ascii 50)))
    (begin
        (asserts! (is-eq tx-sender contract-owner) err-owner-only)
        (asserts! (not (is-verified-manager manager)) err-already-verified)
        (map-set verified-managers manager true)
        (map-set manager-details manager {
            name: name,
            license-number: license-number,
            jurisdiction: jurisdiction,
            verified-at: block-height
        })
        (ok true)
    )
)

(define-public (revoke-manager (manager principal))
    (begin
        (asserts! (is-eq tx-sender contract-owner) err-owner-only)
        (asserts! (is-verified-manager manager) err-not-verified)
        (map-delete verified-managers manager)
        (map-delete manager-details manager)
        (ok true)
    )
)
