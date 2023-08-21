
# Name - Jenkins installer
# Description - This script is written to verify Jenkins Server status and proceed with necessary steps
# Created By - Vijay Yalla
# Created Date - 18-AUG-2023

#!/bin/bash
grep -i jenkins /etc/passwd 1>/dev/null

if [[ $? > 0 ]]; then
	echo "ERROR:: Jenkins server is not installed"
	if [[ $EUID > 0 ]]; then
		echo "ERROR:: This script should run with administrator privileges to install Jenkins Server"
		exit 1
	else
		if type -p java; then
    			echo found java executable in PATH
			_java=java
		elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
			echo found java executable in JAVA_HOME
			_java="$JAVA_HOME/bin/java"
		else
    			echo "INFO:: proceeding with java installation"
			sudo apt install openjdk-11-jdk -y 2>/dev/null
			if [[ $? > 0 ]]; then
				_java=java
				version=$($_java -version 2>&1 | awk -F '"' '/version/{print $2}')
				echo "INFO:: JAVA version - $version is installed successfully"
			else
				echo "ERROR:: JAVA installation is failed"
			fi
		fi

		if [[ "$_java" ]]; then
			wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.332.3_all.deb
			sudo dpkg -i jenkins_2.332.3_all.deb
			sudo apt install jenkins -y 2>/dev/null
			
			if type -p curl; then
				curl -L https://github.com/jenkins-zh/jenkins-cli/releases/latest/download/jcli-linux-amd64.tar.gz|tar xzv
				sudo mv jcli /usr/local/bin/
			fi
			
			systemctl enable jenkins
			systemctl start jenkins
			systemctl status jenkins
			if [[ $? > 0 ]]; then
				echo "ERROR:: Jenkins service is not running"
			fi
		fi
	fi
else
	systemctl status jenkins
	if [[ $? > 0 ]]; then
		echo "INFO:: Starting Jenkins service"
		systemctl start jenkins
		if [[ $? > 0 ]]; then
			echo "ERROR:: Jenkins server is avaialble, but service is failed to start"
			exit 1
		fi
	fi
fi