#!/usr/bin/env bash

sed -e "s/\<hadoop-two\.version\>2\.2\.0<\\/hadoop-two\.version\>/\<hadoop-two\.version\>2\.0\.0-cdh4\.2\.0\<\\/hadoop-two\.version\>/g" ../pom.xml > "../pom_tmp.xml"
mv ../pom_tmp.xml ../pom.xml

sed -e "s/\<version\>0\.94\.2-cdh4\.2\.1\<\\/version\>/\<version\>0\.94\.2-cdh4\.2\.0\<\\/version\>/g" ../stratosphere-addons/hbase/pom.xml > "../stratosphere-addons/hbase/pom_tmp.xml"
mv ../stratosphere-addons/hbase/pom_tmp.xml ../stratosphere-addons/hbase/pom.xml