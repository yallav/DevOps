#####################################################################################################################
# NOTES - 
# 1. Make the script executable: chmod +x create-vHelpU-service.sh.
# 2. Run the script with superuser privileges: sudo ./create-vHelpU-service.sh.
#####################################################################################################################

#!/bin/bash

# Service Name
SERVICE_NAME="vHelpu-springboot"

# User to run the service
SERVICE_USER="ec2-user"

# Path of Spring Boot JAR file
JAR_PATH="/home/ec2-user/myapp/vhelpu.jar"

# Arguments to pass to the Spring Boot application
APP_ARGUMENTS=""

# Working directory
WORKING_DIRECTORY="/home/ec2-user/myapp"

# Create a systemd service unit file
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"
cat << EOF > $SERVICE_FILE
[Unit]
Description=vHelpU Spring Boot Application
Documentation=http://www.vhelpu.com

[Service]
User=$SERVICE_USER
WorkingDirectory=$WORKING_DIRECTORY
ExecStart=/usr/bin/java -jar $JAR_PATH $APP_ARGUMENTS
Restart=always
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reload

# Enable and start the service
sudo systemctl enable $SERVICE_NAME
sudo systemctl start $SERVICE_NAME

# Display service status
sudo systemctl status $SERVICE_NAME