export PATH=$PATH:/Users/hongshuwang/Desktop/cophi/defects4j/framework/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_202`

#!/usr/bin/env bash
#This script is used to check out all the bug and fix version of the whole repository,

basePath=/Users/hongshuwang/doc/bug_repo

bid="b"
fid="f"
projectName="Lang"
bugNum="52"
#projectPath=""

for ((i=0;i<1;i++)); do
	projectPath="$basePath/$projectName"
	v=$bugNum
		echo $v

		bugPath="$projectPath/$v"
		buggyPath="$bugPath/bug"
		fixPath="$bugPath/fix"

		echo $buggyPath

		mkdir -p $buggyPath
		mkdir -p $fixPath

		#echo "defects4j checkout -p $projectName -v $v$bid -w $buggyPath"

		defects4j checkout -p $projectName -v $v$bid -w $buggyPath
		cd $buggyPath
		defects4j compile
		defects4j test
		defects4j checkout -p $projectName -v $v$fid -w $fixPath
		cd $fixPath
		defects4j compile
		defects4j test
#	done
	
done
