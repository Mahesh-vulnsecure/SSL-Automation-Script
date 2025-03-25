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
