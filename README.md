# Decentralized Legal Case Management System

A comprehensive blockchain-based legal case management system built on the Stacks blockchain using Clarity smart contracts.

## Overview

This system provides a decentralized platform for managing legal cases, ensuring transparency, immutability, and secure access control for legal professionals and their clients.

## Features

### 🔐 Case Manager Verification
- Validates legal case managers with license verification
- Maintains manager credentials and jurisdiction information
- Owner-controlled verification and revocation system

### 📋 Case Tracking
- Create and manage legal cases
- Track case status (Open, In Progress, Closed, Archived)
- Associate cases with verified managers and clients
- Immutable case history and updates

### 📄 Document Management
- Secure document upload with hash verification
- Granular access control for confidential documents
- Support for multiple document types (Evidence, Contracts, Correspondence, Filings)
- Manager-controlled access permissions

### ⏰ Timeline Coordination
- Create and manage case milestones
- Set deadlines and track completion status
- Automatic overdue detection
- Timeline visibility for all case participants

### 📊 Outcome Tracking
- Record case outcomes and results
- Support for various outcome types (Settlement, Judgment, Dismissal, Withdrawal)
- Financial amount tracking for settlements
- Attach supporting documents to outcomes

## Smart Contracts

### 1. Case Manager Verification (\`case-manager-verification.clar\`)
Manages the verification and validation of legal case managers.

**Key Functions:**
- \`verify-manager\`: Verify a new case manager
- \`revoke-manager\`: Revoke manager verification
- \`is-verified-manager\`: Check if a manager is verified
- \`get-manager-details\`: Get manager information

### 2. Case Tracking (\`case-tracking.clar\`)
Core contract for managing legal cases and their lifecycle.

**Key Functions:**
- \`create-case\`: Create a new legal case
- \`update-case-status\`: Update case status
- \`update-case-description\`: Modify case description
- \`get-case\`: Retrieve case information

### 3. Document Management (\`document-management.clar\`)
Handles secure document storage and access control.

**Key Functions:**
- \`upload-document\`: Upload a new document
- \`grant-document-access\`: Grant access to specific users
- \`revoke-document-access\`: Revoke document access
- \`has-document-access\`: Check access permissions

### 4. Timeline Coordination (\`timeline-coordination.clar\`)
Manages case milestones and deadlines.

**Key Functions:**
- \`create-milestone\`: Create a new milestone
- \`complete-milestone\`: Mark milestone as completed
- \`mark-milestone-overdue\`: Mark overdue milestones
- \`is-milestone-overdue\`: Check if milestone is overdue

### 5. Outcome Tracking (\`outcome-tracking.clar\`)
Records and manages case outcomes and results.

**Key Functions:**
- \`record-outcome\`: Record a case outcome
- \`update-outcome\`: Update existing outcome
- \`attach-outcome-document\`: Link documents to outcomes
- \`get-case-outcome\`: Retrieve outcome information

## Getting Started

### Prerequisites
- Stacks blockchain node or access to testnet/mainnet
- Clarity CLI for contract deployment
- Compatible wallet for transaction signing

### Deployment

1. Deploy contracts in the following order:
   \`\`\`bash
   clarinet deploy case-manager-verification
   clarinet deploy case-tracking
   clarinet deploy document-management
   clarinet deploy timeline-coordination
   clarinet deploy outcome-tracking
   \`\`\`

2. Verify the contract owner and initialize the system:
   \`\`\`clarity
   ;; Verify the first case manager
   (contract-call? .case-manager-verification verify-manager
   'SP1MANAGER...
   "John Doe"
   "BAR123456"
   "New York")
   \`\`\`

### Usage Example

1. **Verify a Case Manager:**
   \`\`\`clarity
   (contract-call? .case-manager-verification verify-manager
   'SP1MANAGER...
   "Jane Smith"
   "BAR789012"
   "California")
   \`\`\`

2. **Create a New Case:**
   \`\`\`clarity
   (contract-call? .case-tracking create-case
   "Contract Dispute - ABC Corp"
   "Dispute over service agreement terms and payment"
   'SP1CLIENT...)
   \`\`\`

3. **Upload a Document:**
   \`\`\`clarity
   (contract-call? .document-management upload-document
   u1
   "Service Agreement"
   "a1b2c3d4e5f6..."
   u2
   false)
   \`\`\`

4. **Create a Milestone:**
   \`\`\`clarity
   (contract-call? .timeline-coordination create-milestone
   u1
   "Discovery Phase Complete"
   "Complete document discovery and depositions"
   u1000)
   \`\`\`

5. **Record an Outcome:**
   \`\`\`clarity
   (contract-call? .outcome-tracking record-outcome
   u1
   u1
   "Settlement reached for $50,000"
   (some u50000)
   true)
   \`\`\`

## Security Features

- **Access Control**: Only verified managers can create and manage cases
- **Data Integrity**: All data is stored immutably on the blockchain
- **Document Security**: Hash-based document verification and access control
- **Audit Trail**: Complete history of all case activities and changes

## Error Codes

| Contract | Error Code | Description |
|----------|------------|-------------|
| Case Manager Verification | u100-u103 | Owner-only, verification, and validation errors |
| Case Tracking | u200-u203 | Authorization, case not found, and status errors |
| Document Management | u300-u303 | Document access and validation errors |
| Timeline Coordination | u400-u403 | Milestone and deadline errors |
| Outcome Tracking | u500-u503 | Outcome recording and validation errors |

## Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository or contact the development team.

