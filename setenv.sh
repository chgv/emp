#!/bin/bash

export HOSTNAME=$(hostname)

export JAVA_OPTS="$JAVA_OPTS -Ddbpassword=${EMP_DB_PWD} -Ddbusername=${EMP_DB_USR} -Dhostname=$HOSTNAME"
