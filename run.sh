#!/bin/bash
# Sample shell script to run OpenIG examples
# Usage: run.sh sample_directory

if [ "$#" -ne 1 ];
then
 echo "Must provide sample directory"
 echo "Example: run.sh example1"
 exit 1
fi

SAMPLE=$1



DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# The examples make use of stored secrets, client id, etc.
# Put these secrets in environment variables in env.sh
# These variables can be referenced in OpenIG using "${env.MYSECRET}"
# The file env.sh is ignored in git and will not be checked in.

if [ -f $DIR/env.sh ];
then
    source $DIR/env.sh
else
    echo "env.sh not found. Copy env.template to env.sh and edit as required"
    exit 1
fi

# JETTY_HOME is defined in env.sh


cd $JETTY_HOME
java -Dopenig.base=$DIR/$SAMPLE -jar start.jar


