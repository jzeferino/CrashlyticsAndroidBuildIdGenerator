#!/bin/bash
declare outputFile="generated_crashlytics_ids.txt"
declare fabricApiKey="yourfabrickey"
declare -a array=(                
                "com.test.build"
                "com.test.build.qa"
                "com.test.build.dev")
                
# get length of an array
array_length=${#array[@]}

rm -rf ${outputFile}

for ((i=0;i<${array_length};i++));
do
    OUTPUT="$(./gradlew -Ppackagename="${array[$i]}" -PfabricApiKey="$fabricApiKey" -PoutputFile="$outputFile" build >&2)"  
done

echo "*** DONE ***"
echo "fabric api key: ${fabricApiKey}"
cat ${outputFile}