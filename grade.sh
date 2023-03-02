CPATH= ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f ./student-submission/ListExamples.java ]]; then
    echo "File ListExamples.java exists"
else
    echo "File ListExamples.java does not exist"
    exit
fi 

cd student-submission

cp ../TestListExamples.java ./

cp -rf ../lib .

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2> javac-error.txt

#javac TestListExamples.java ListExamples.java

if [ $? -ne 0 ]; then
  echo "Compilation failed"
else
  echo "Compilation succeeded"
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples  > TestResult.txt



# if [[ grep -o "OK" ]]; then
#     echo  "You passed all tests"
# else
#     echo"x tests passed, y tests failed"
#     exit
# fi 

# echo TestResult.txt

# var = $(grep -o 'OK ([0-9]* test)' TestResult.txt | grep -o [0-9]*)

# echo $var

cat TestResult.txt
