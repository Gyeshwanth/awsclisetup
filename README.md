# 🚀 AWS CLI v2 Installation & Configuration on Ubuntu 24.04 (Noble Numbat)

This guide walks you through installing AWS CLI v2 on **Ubuntu 24.04**, configuring it for the **Mumbai region (`ap-south-1`)**, and verifying your setup.

---

## ✅ Step 1: Install AWS CLI v2 via Official Installer

Since `awscli` via `apt` isn't available yet for Ubuntu 24.04, follow these steps:

### 1. Download the Installer

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

### 2. Install `unzip` (if not installed)

```bash
sudo apt update
sudo apt install unzip -y
```

### 3. Unzip the Installer

```bash
unzip awscliv2.zip
```

### 4. Run the Installer

```bash
sudo ./aws/install
```

---

## ✅ Step 2: Verify AWS CLI Installation

```bash
aws --version
```

**Expected Output:**

```
aws-cli/2.x.x Python/3.x.x Linux/...
```

---

## ✅ Step 3: Create an IAM User (if not already done)

1. Go to [IAM Console](https://console.aws.amazon.com/iam/)
2. Navigate to **Users > Add user**
3. Provide a username (e.g., `cli-user`)
4. Enable **Programmatic access/CLI**
5. Attach a policy (e.g., `AdministratorAccess` or a custom policy)
6. Create the user and **download the credentials**:
   - Access Key ID
   - Secret Access Key

---

## ✅ Step 4: Configure AWS CLI

Run the following command:

```bash
aws configure
```

Enter the following when prompted:

```
AWS Access Key ID [None]: YOUR_ACCESS_KEY
AWS Secret Access Key [None]: YOUR_SECRET_KEY
Default region name [None]: ap-south-1
Default output format [None]: json
```

> ✅ **Note:** `ap-south-1` is the region code for **Mumbai**.

---

## ✅ Step 5: Test the Configuration

Run the following command to test:

```bash
aws sts get-caller-identity
```

**Expected Output:**

```json
{
    "UserId": "YOUR_USER_ID",
    "Account": "YOUR_ACCOUNT_ID",
    "Arn": "arn:aws:iam::YOUR_ACCOUNT_ID:user/cli-user"
}
```

---

## 📌 Optional: Set Up Multiple AWS Profiles (e.g., dev, prod)

Let me know if you'd like to manage multiple environments using named profiles like:

```bash
aws configure --profile dev
aws configure --profile prod
```

---

## ✅ Done!

You’ve successfully installed and configured AWS CLI v2 on **Ubuntu 24.04** with the **Mumbai (`ap-south-1`)** region.

Happy Clouding ☁

