#!/usr/bin/env bash

./set_versions.sh
./generate_specific_pom.sh 0.4-SNAPSHOT 0.4-hadoop2-SNAPSHOT pom.xml
./fix_pom_modules.sh