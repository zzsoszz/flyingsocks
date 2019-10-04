#!/usr/bin/env bash

if [ "$1" == "-install" ]; then
    echo "make folder /var/log/flyingsocks-cli"
    mkdir /var/log/flyingsocks-cli
    echo "make folder /etc/flyingsocks-cli"
    mkdir /etc/flyingsocks-cli
    echo "Install Done, you can use config-file-tool to configure server"
    exit 0
fi

java -version
if [ $? -ne 0 ]; then
    echo "No java command found in PATH"
    exit 0
fi

JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
echo "Java version: " $JAVA_VERSION

if [ "$1" == "-daemon" ]; then
    nohup java -server -Xbootclasspath/a:../conf:../ -jar ../lib/flyingsocks-server-1.1.jar >/dev/null  &
else
    java -server -Xbootclasspath/a:../conf:../ -jar ../lib/flyingsocks-server-1.1.jar
fi