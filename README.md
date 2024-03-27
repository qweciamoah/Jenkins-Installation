

---

# Jenkins Setup Script

This script automates the installation and configuration of Jenkins on an Ubuntu EC2 instance. Follow the steps below to set up Jenkins:

## Prerequisites

1. **Ubuntu EC2 Instance**: Ensure you have an Ubuntu-based EC2 instance running on AWS.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/jenkins-setup.git
   cd jenkins-script.sh
   ```

2. **Run the Script**:
   ```bash
   chmod +x jenkins-script.sh
   ./jenkins-script.sh
   OR
   sudo bash jenkins-script.sh
   ```

3. **Access Jenkins GUI**:
   - After successful installation, visit `http://your-IPaddress:8080` in your web browser.
   - Follow the instructions to set up Jenkins (retrieve the initial admin password from the Jenkins logs).

## Important Notes

- Replace `"your-IPaddress"` with the actual IP address of your EC2 instance.
- Ensure that port 8080 is open in your security group settings.
- For security reasons, change the default Jenkins admin password after installation.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
 Happy Jenkins-ing! 🚀🔧
