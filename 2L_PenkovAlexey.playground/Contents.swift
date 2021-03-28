//: Playground - noun: a place where people can play

import UIKit

//Задание №1
print("Задание №1. Написать функцию, которая определяет, четное число или нет.")

/* изначально сделал так. Но для задания №4 пришлось переделать как для задания №2
 
 func checkNumbers(number: Int) {
    if number % 2 == 0{
        print("Число \(number) является четным")
    }else{
        print("Число \(number) является нечетным")
    }
}

let a = 45

checkNumbers(number: a)*/

func checkNumbers(number: Int) -> Bool{
    return number % 2 == 0 ? true : false
}

let a = 46

if checkNumbers(number: a){
    print("Число \(a) является четным")
}else{
    print("Число \(a) является нечетным")
}

print("-----------------------------------------------------------------------")

//Задание №2
print("Задание №2. Написать функцию, которая определяет, делится ли число без остатка на 3.")

func checkNumbers2(number: Int) -> Bool {
    if number % 3 == 0{
        return true
    }else{
        return false
    }

}

let x = 29

if checkNumbers2(number: x){
   print("Число \(x) делится на 3 без остатка")
}else{
    print("Число \(x) не делится на 3 без остатка")
}
print("-----------------------------------------------------------------------")

//Задание №3.

print("Задание №3. Создать возрастающий массив.")

var array: [Int] = []
for i in 0...99 {
    array.append(i)
}
print(array)
print("-----------------------------------------------------------------------")

//Задание №4.
print("Задание №4. Удалить из этого массива все четные числа и все числа которые не делятся на 3.")

var index = 0
for element in array {
    if checkNumbers(number: element) || !checkNumbers2(number: element){
        array.remove(at: index)
        index -= 1
    }
    index += 1
}
print(array)
print("-----------------------------------------------------------------------")

//Задание №5
print("Задание №5. Написать функцию которая добавляет в массив новое число Фибаначчи, и добавить при помощи нее 50 элементов.")

func getNumberFib(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

var arrFib: [Int] = [0, 1]
//переменную index объявлял в предыдущем задании

index = 1
for i in 2...51{
    arrFib.append(getNumberFib(num1: arrFib[i-1], num2: arrFib[i-2]))
    index += i;
}
print(arrFib)
print("-----------------------------------------------------------------------")

//Задание №6
print("Заполнить массив из 100 элементов различными простыми числами...")

func isPrime(n: Int) -> Bool{
    if (n==1){
        return false
    }
    var d = 2
    while d*d <= n {
        if n%d==0{
            return false
        }
        d+=1
    }
    return true
}

var arrPrimeNumbers : [Int] = []
var i = 1
while arrPrimeNumbers.count<=100{
    if isPrime(n: i){
        arrPrimeNumbers.append(i)
    }
    i+=1
}
print(arrPrimeNumbers)

//Сначала пытался сделать как в методичке (метод Эратосфена), но не смог докрутить этот вариант. решил сразу заполнять массив числами проверяя их на простоту. Интернет говорит что такой способ ресурсозатратней, но вроде работает.

/*func arrModify(arr: [Int], step : Int) -> [Int]{
    var newArray = arr
    index = 0;
    while index + step <= newArray.count{
        newArray.remove(at: index+step)
       // print(index+step)
        index += 1
    }
    return newArray
}

var n = 1


var arrSimpleNumbers:[Int] = []

for i in n+1...n+101{
    arrSimpleNumbers.append(i)
}


arrSimpleNumbers = arrModify(arr: arrSimpleNumbers, step: arrSimpleNumbers[0])

print(arrSimpleNumbers)
print(arrSimpleNumbers.count)*/




