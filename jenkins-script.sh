
#!/bin/bash
#Author: AMOAH PAUL
#Date Created: 27th March 2024

current_datetime=$(date +"%Y-%m-%d_%H:%M:%S")
logfile="/var/log/tomcat-install_${current_datetime}.log"

# Function to log and exit on error
 log_and_exit() {
     echo "Error: $1" | sudo tee -a "${logfile}"
         exit 1
     }
         
# Function to log to both file and terminal
 log() {
     echo "$1" | sudo tee -a "${logfile}"
     }

# Check if the log file exists; if not, create it
 if [ ! -e "$logfile" ]; then
     touch "$logfile" || log_and_exit "Unable to create log file."
     fi

# Changing The Hostname of The EC2
echo "changing Hostname"
sudo hostnamectl set-hostname jenkins
log "Setting hostname - Completed"

echo "Update and Upgrade the Ubuntu EC2"
sudo apt update -y >/dev/null 2>&1 || log_and_exit "Unable to update packages."
sudo apt upgrade -y >/dev/null 2>&1 || log_and_exit "Unable to upgrade packages."
log "Step 2: Update and upgrade - Completed"

# Installation and Verification of Java
echo " installing and verifying ...."
sudo apt install fontconfig openjdk-17-jre -y || log_and_exit "Unable to install dependencies."
java -version
log "Step 3: Install java dependencies - Completed"

# Installation of Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null|| log_and_exit "Unable to install jenkins."
log "step 4: install jenkins - completed"

#installation of jenkins II
sudo apt-get update -y
sudo apt-get install jenkins -y|| log_and_exit "Unable to install jenkinsb."
log "step 4b: install jenkins - completed"

# Start and EnableJenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins|| log_and_exit "Unable to enable jenkins."
log "step 5: install jenkins - completed"

#Verify Status of Jenkins
sudo systemctl status jenkins|| log_and_exit "Unable to check status jenkins."
log "step 6: install jenkins - completed"

echo "Jenkins successfully installed" 

echo "type http://your-IPaddress:port8080 to access your jenkins GUI"| sudo tee -a "${logfile}"



