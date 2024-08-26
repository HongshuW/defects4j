export PATH=$PATH:/Users/hongshuwang/Desktop/cophi/defects4j/framework/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_202`

#!/usr/bin/env bash
#This script is used to check out all the bug and fix version of the whole repository,

projects=(Chart Cli Closure Codec Collections Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Lang Math Mockito Time)
bugNums=(26 40 176 18 28 47 16 18 26 112 6 93 22 65 106 38 27)

basePath=/Users/hongshuwang/doc/bug_repo

bid="b"
fid="f"

for (( i=0; i<17; i=i+1 ));
do
	#echo ${projects[$i]}
	projectName=${projects[$i]}
	bugNum=${bugNums[$i]}
	projectPath="$basePath/$projectName"
	for (( j=0; j<bugNum; j=j+1 ));
	do
		v=$(($j+1))
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
	done

done
