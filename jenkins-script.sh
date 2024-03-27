
#!/bin/bash
#Author: AMOAH PAUL
#Date Created: 27th March 2024


# Changing The Hostname of The EC2
echo "changing Hostname"
sudo hostnamectl set-hostname jenkins

echo "Update and Upgrade the Ubuntu EC2"
sudo apt update -y >/dev/null 2>&1
sudo apt upgrade -y >/dev/null 2>&1

# Installation and Verification of Java
echo " installing and verifying ...."
sudo apt install fontconfig openjdk-17-jre -y
java -version

# Installation of Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

#installation of jenkins II
sudo apt-get update -y
sudo apt-get install jenkins -y

# Start and EnableJenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

#Verify Status of Jenkins
sudo systemctl status jenkins

echo "Jenkins successfully installed" 

echo "type http://your-IPaddress:port8080 to access your jenkins GUI"



