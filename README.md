# 🚀 Apache + Certbot SSL Automation Script

## 📌 Overview
This script automates the installation and configuration of **Let's Encrypt SSL certificates** using **Certbot and Apache**. It ensures that SSL is correctly set up, configured for automatic renewal, and logs all actions for easy debugging.  

## ✅ Features
- 🔄 **Automatically installs** Apache and Certbot if missing  
- 🔍 **Validates** domain and email input  
- 🔑 **Obtains SSL certificates** for a given domain  
- ⏳ **Configures auto-renewal** of SSL certificates  
- 📜 **Logs all actions** in `/var/log/certbot-automation.log`  
- ⚠️ **Handles errors gracefully** and provides helpful messages  

---

## 🛠️ Prerequisites
Ensure your server meets the following conditions:  
- A **Linux-based OS** (Ubuntu, Debian, etc.)  
- **Root or sudo privileges**  
- A **fully registered domain name**  
- **Apache installed and running** (if not, the script will install it)  

---

## 📥 Installation & Usage
### 🔹 **Clone this repository**
```bash
git clone https://github.com/your-username/certbot-apache-ssl.git
cd certbot-apache-ssl

---

### 🔹 **Make the script executable**
```bash
chmod +x certbot-apache.sh

---

### 🔹 **Run the script**
```bash
sudo ./certbot-apache.sh

---

### 🔹 **Follow the prompts**
- **Enter your domain name** (e.g., example.com).
- **Enter your email address** for SSL notifications.
- The script will handle installation, certificate issuance, and renewal setup.

---

###⚙️ **How It Works**
### **Step 1: Installing Required Packages**
- Checks if **Apache** is installed. If not, installs and starts it.
- Checks if **Certbot** is installed. If not, installs it.
- Ensures **Apache is running** before proceeding.

### **Step 2: Obtaining SSL Certificate***
- Uses Certbot to request an SSL certificate for the given domain.
- Configures automatic HTTP to HTTPS redirection.
- Logs certificate details in /var/log/certbot-automation.log.

### **Step 3: Setting Up Auto-Renewal**
- Adds a cron job (/etc/cron.d/certbot-auto-renew) to renew SSL certificates automatically.
- The cron job runs daily at 3 AM and logs outputs.

### **Step 4: Restarting Apache**
- After installation and renewal, Apache is restarted to apply changes.

---
