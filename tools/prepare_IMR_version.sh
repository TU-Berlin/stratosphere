#!/usr/bin/env bash

./set_versions.sh
./generate_specific_pom.sh 0.5-SNAPSHOT 0.5-hadoop2-SNAPSHOT pom.xml
./fix_pom_modules.sh