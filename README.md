# 🚀 Apache + Certbot SSL Automation Script

## 📌 Overview
This script automates the installation and configuration of **Let's Encrypt SSL certificates** using **Certbot and Apache**. It ensures that SSL is correctly set up, configured for automatic renewal, and logs all actions for easy debugging.  

## ✅ Features
- 🔄 **Automatically installs** Apache and Certbot if missing  
- 🔍 **Validates** domain and email input  
- 🔑 **Obtains SSL certificates** for a given domain  
- ⏳ **Configures auto-renewal** of SSL certificates  
- 📝 **Logs all actions** in `/var/log/certbot-automation.log`  
- ⚠️ **Handles errors gracefully** and provides helpful messages  

---

## 🛠️ Prerequisites
Ensure your server meets the following conditions:  
- A **Linux-based OS** (Ubuntu, Debian, etc.)  
- **Root or sudo privileges**  
- A **fully registered domain name**  
- **Apache installed and running** (if not, the script will install it)  

---

## 💅 Installation & Usage
### 🔹 **Clone this repository**
```bash
git clone https://github.com/Mahesh-vulnsecure/SSL-Automation-Script.git
cd certbot-apache-ssl
```
### 🔹 **Make the script executable**
```bash
chmod +x certbot-apache.sh
```
### 🔹 **Run the script**
```bash
sudo ./certbot-apache.sh
```
### 🔹 **Follow the prompts**
- **Enter your domain name** (e.g., `example.com`).  
- **Enter your email address** for SSL notifications.  
- The script will handle installation, certificate issuance, and renewal setup.  

---

## ⚙️ How It Works  
### **Step 1: Installing Required Packages**  
- Checks if **Apache** is installed. If not, installs and starts it.  
- Checks if **Certbot** is installed. If not, installs it.  
- Ensures **Apache is running** before proceeding.  

### **Step 2: Obtaining SSL Certificate**  
- Uses Certbot to request an SSL certificate for the given domain.  
- Configures **automatic HTTP to HTTPS redirection**.  
- Logs certificate details in `/var/log/certbot-automation.log`.  

### **Step 3: Setting Up Auto-Renewal**  
- Adds a cron job (`/etc/cron.d/certbot-auto-renew`) to renew SSL certificates automatically.  
- The cron job runs daily at `3 AM` and logs outputs.  

### **Step 4: Restarting Apache**  
- After installation and renewal, Apache is restarted to apply changes.  

---

## 📄 Logging & Monitoring  
All actions and errors are logged in:  
```bash
/var/log/certbot-automation.log
```
### **Check the logs:**  
```bash
cat /var/log/certbot-automation.log
```
### **Example Log Entry:**  
```
2025-03-25 12:45:30 - ✅ Certbot installed successfully.
2025-03-25 12:46:10 - 📝 Requesting SSL certificate for example.com...
2025-03-25 12:46:45 - ✅ SSL certificate issued successfully for example.com.
2025-03-25 12:47:05 - 🔄 Restarting Apache...
2025-03-25 12:47:07 - ✅ Apache restarted successfully.
```

---

## 🔄 Verifying SSL & Auto-Renewal  
### **1. Check if SSL is installed properly**  
```bash
sudo certbot certificates
```
### **2. Manually test SSL renewal**  
```bash
sudo certbot renew --dry-run
```
If successful, Certbot will confirm that the renewal process works.  

---

## ⚠️ Troubleshooting  
### ❌ **Apache is Not Running**  
🔴 Error: `"Apache is not running. Start it using: sudo systemctl start apache2"`  
✅ **Fix:** Run  
```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

### ❌ **Certbot Command Not Found**  
🔴 Error: `"certbot: command not found"`  
✅ **Fix:** Run  
```bash
sudo apt update && sudo apt install -y certbot python3-certbot-apache
```

### ❌ **SSL Certificate Not Issued**  
🔴 Error: `"Failed to obtain SSL certificate"`  
✅ **Fix:**  
- Ensure the domain is **correct** and **resolves to your server's IP**.  
- Check Apache’s configuration with:  
  ```bash
  sudo apachectl configtest
  ```
- Restart Apache:  
  ```bash
  sudo systemctl restart apache2
  ```
- Manually try getting a certificate:  
  ```bash
  sudo certbot --apache -d yourdomain.com
  ```

---

## 🗑️ Uninstalling SSL & Certbot  
If you ever need to **remove SSL** and Certbot:  
```bash
sudo certbot delete --cert-name yourdomain.com
sudo apt remove --purge certbot python3-certbot-apache -y
sudo rm -rf /etc/letsencrypt
```

---

## ❓ FAQs  
### **1. What happens if SSL renewal fails?**  
Certbot will attempt to **renew every day**. If it fails, an error will be logged in `/var/log/certbot-automation.log`. You’ll also receive email notifications.  

### **2. Can I use this for multiple domains?**  
Yes! Run the script multiple times with different domains or use:  
```bash
sudo certbot --apache -d domain1.com -d domain2.com
```

### **3. Does this work with Nginx?**  
No, this script is **Apache-specific**. For Nginx, replace `--apache` with `--nginx` in the Certbot command.  

---

## 📝 License  
This project is licensed under the **MIT License**.  

---

## ⭐ Support & Contributions  
- **Found a bug?** Open an issue!  
- **Want to contribute?** Fork the repo and submit a PR.  
- **Need help?** [Open a discussion](https://github.com/your-username/certbot-apache-ssl/discussions).  

---

🎉 **Enjoy automated SSL management with Certbot & Apache!** 🚀  
