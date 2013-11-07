# IMR Production Version
The dependencies of Stratosphere need to be adjusted to match the software deployed in IMRs production system.
The following steps describe how to perform that modification.
Step 1 and 2 can be performed faster by running the
./tools/prepare_IMR_version.sh script.

Afterwards you can continue compile Stratopshere and deploy it to you local maven repository. (Step 3)
The modified Stratosphere version is also compatible with most IDEs.

## 1. Set Correct Hadoop/HBase Version
Hadoop Version:
open ./pom.xml
and change
<hadoop-two.version>2.0.0-cdh4.2.1</hadoop-two.version>
to
<hadoop-two.version>2.0.0-cdh4.2.0</hadoop-two.version>

open ./pact/pact-hbase/pom.xml
and change the version of the hbase dependency from
<version>0.94.2-cdh4.2.1</version>
to
<version>0.94.2-cdh4.2.0</version>

## 2. Generate the poms
go to ./tools

- Generate the poms that configures Stratosphere to use the Hadoop and HBase versions of the environment
	- run generate_specific_pom.sh <oldversion> <newversion> pom.xml
	- **<newversion> has to contain the substring "hadoop2" otherwise it will fail to generate the correct dependencies**
	- Example:
	./generate_specific_pom.sh 0.4-SNAPSHOT 0.4-hadoop2-SNAPSHOT pom.xml

- Fix the poms to be IDE compliant
	./fix_pom_modules.sh


## 3. Install Locally
mvm clean install -DskipTests