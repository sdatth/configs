# !/bin/bash/

### syntax rules
1. when defining a variable whitespaces must be eliminated
2. include the shell in all the scripts at the beginning of the file (#!/bin/bash)

3. $var is used to print the value of the variable
4.  $(command) is used to execute a command
5.  $((expression)) this format is used to perform math operations and it returns the value at the end
6.  ((expression)) performs math operation but doesn't return the value

<br>

```
# echo 
read -p "Enter your name " name
echo "hello world $name"
read -p "Enter your first and last name " first_name last_name
echo "Grettings to $first_name $last_name"
# -sp flag is used to hide user input
read -sp "Enter secret code " code
echo $code
echo "this text will be in a file" > file1

# math
num1=1
num2=1
sum=$((num1 + num2))
echo $sum
sum=$(python3 -c "print($num1+$num2)")
echo "sum is $sum"

# let keyword
rand=5
let rand+=1
echo $rand

# if statements
if (( num1 < num2 || num1 == num2 ))
then
    echo "$num1 is greater"
else
    echo "$num2 is greater"
fi

# other method of if (ge - >= , le - <= , gt - > , lt - < , eq - == , ne - !=)
age=18
if [ $age -ge 18 ]
then
    echo "you can drive"
elif [ $age -lt 18 ] 
then
    echo "you cant drive"
fi

# one more method of the above
age=18
if [ $age -ge 18 ]; then
    echo "you can drive"
elif [ $age -lt 18 ]; then
    echo "you cant drive"
fi


# nested execution
echo $(( myvar = 7 + $(( vartwo = 4 + 4 )) ))

# print multiple lines (END word can be replaced with anything)
cat<< END
this is a big paragraph
and it can be in multiple 
lines like this
END

# when a function is called within a variable var=$(funcation_name) , then all the multiple echo statements made inside the function would accumulate in "var"
function1(){
    echo "Start of the func"
    local num1=$1
    local num2=$2
    local sum=$(( num1 + num2 ))
    echo "Sum total inside func $sum"
    echo "end of the func"
}

echo "Before the func "
var=$(function1 10 11)
echo "after the func"
echo "Variable 'var' being called where output of function1 resides"
echo "$var"

# function being called without using any varible to store the output
function2(){
    echo "Start of the func"
    local num1=$1
    local num2=$2
    local sum=$(( num1 + num2 ))
    echo "Sum total inside func $sum"
    echo "end of the func"
}

echo "Before the func "
function2 10 11
echo "after the func"

#global and local variables
var_change () {
    local var1='local 1'
    echo Inside function: var1 is $var1 : var2 is $var2
    var1='changed again'
    var2='2 changed again'
    
}
var1='global 1'
var2='global 2'
echo Before function call: var1 is $var1 : var2 is $var2
var_change
echo After function call: var1 is $var1 : var2 is $var2

# string 
str1=""

if [ "$str1"  ]; then
    echo "string is not null"
else
    echo "string is null"
fi

# the -z flag checks whether the string is null
if [ -z $str1  ]; then
    echo "String is null"
else
    echo "String is not null"
fi

# -e flag checks whether a file exists or not
# -f checks whether it is a normal file
# -r chechs if it is readable
# -w checks if it is writable
# -x checks if it is executable
# -d checks if it is a directory
# -L is it a symbolic link
# -G is it owned by the group
# -O is it owned by the usedid
file="./file2"

if [ -e $file  ]; then
        echo "$file exists"
    else
        echo "$file doesn't exist"
fi

#case 
read -p "Enter your age " age

case $age in
    [0-4])
        echo "to young for school"
        ;;
    [5])
        echo "go to kindergarten"
        ;;
    [6-9]|1[0-8])                         #checks from 6 to 18
        grade=$((age-5))
        echo "go to grade $grade"
        ;;                                #default statment
    *)           
        echo "too old for school"
esac

```

<br>
