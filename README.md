# HashiCorp Vault Deployment on GCP VM Guide

This guide provides step-by-step instructions for deploying HashiCorp Vault on a Google Cloud Platform (GCP) VM, connecting to it using SSH and VS Code, and configuring firewall rules for ports.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Create a GCP VM](#create-a-gcp-vm)
3. [Install HashiCorp Vault](#install-hashicorp-vault)
4. [Configure HashiCorp Vault](#configure-hashicorp-vault)
6. [Connect using VS Code](#connect-using-vs-code)
7. [Access Vault Web Interface](#access-vault-web-interface)

## Prerequisites

- Google Cloud Platform (GCP) account
- GCP VM instance with appropriate OS (e.g., Ubuntu)
- SSH client (e.g., `gcloud` command or standalone SSH)
- HashiCorp Vault installation knowledge
- Basic knowledge of VS Code

## Create a GCP VM

1. Log in to your GCP Console: https://console.cloud.google.com/
2. Create a new VM instance:
   - Navigate to "Compute Engine" > "VM instances".
   - Click "Create Instance."
   - Configure VM settings, including the operating system.
   - Under "Firewall," check "Allow HTTP traffic" and "Allow HTTPS traffic."
   - Click "Create."

## Install HashiCorp Vault

1. SSH into the VM:
   ```
   gcloud compute ssh YOUR_VM_INSTANCE_NAME
   ```

2. Install Vault:
   ```
   sudo apt-get update
   sudo apt-get install vault
   vault -v
   ```
you can also add the install script in the main.tf file


## Configure HashiCorp Vault

1. Initialize and unseal Vault:
   ```
   vault server -dev    #initialize in dev mode
   ```

2. Set up authentication and secrets engine as needed.

   ```
   vault kv put secret/hello foo=world
   ```

## Connect using VS Code

1. Install "Remote - SSH" extension for VS Code.
2. Click "Remote Explorer" > "Connect to Host..."
3. Enter SSH connection string: `username@vm_external_ip`

## Access Vault Web Interface

1. Use port forwarding in the VS Code terminal:
   ```
   add port 8200
   ```
2. Access Vault web interface in your browser: http://localhost:8200

**Note:** This is a simplified guide. Refer to official HashiCorp Vault and GCP documentation for detailed instructions.

## Security Considerations

- Follow security best practices for VMs and Vault deployments.
- Restrict access to necessary IP ranges in firewall rules.
- Use strong authentication methods and secure communication for Vault.
 
