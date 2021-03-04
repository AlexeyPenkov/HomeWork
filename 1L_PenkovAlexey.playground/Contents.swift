//: Playground - noun: a place where people can play

import UIKit

//Задание №1


let a: Int = 3
let b: Int = 4
let c: Int = 1
print("Задание №1. Квадратное уровнение",a,"х^2+",b,"x+",c,"=0")

let D = pow(Double(b), 2) - Double(4*a*c)

print("Дискриминант D =",D)

if (D > 0){
    let x1 = (-Double(b)+sqrt(Double(D)))/Double(2*a)
    let x2 = (-Double(b)-sqrt(Double(D)))/Double(2*a)
    print ("Так как D > 0 решении будет 2:")
    print ("x1 =", x1)
    print ("x2 =", x2)
} else if (D == 0){
    let x = -b/2*a
    print ("Так как D = 0 решение будет одно:")
    print ("x =",x)
} else{
    print ("Так как D < 0 решения у этого уровнения нет")
}
print("---------------------------------------------------------")

//Задание №2

let k1: Int = 5
let k2: Int = 8

print(" Задание №2. Даны катеты прямоугольного треугольника")
print("Длина первого:",k1," длина второго:",k2)

let g = sqrt(pow(Double(k1),2)+pow(Double(k2), 2))

let P = g + Double(k1) + Double(k2)

let S = k1*k2/2;

print("Ответ:")
print("Длина гипотенузы =", g)
print("Периметр =", P)
print("Площадь =", S)
print("---------------------------------------------------------")

//Задание №2

var sum:Double = 15000
let procent:Float = 5.5
var i = 1
var year:Int = 1

print("Задание №3. Сумма вклада:",sum, " Годовой процент:", procent)

while (i<=60){
    sum = sum + sum*Double(procent)/12/100
    if (i%12==0){
        //пытался сумму привести к денежному формат. пока не получилось ) оставил так как есть...
        print("Сумма вклада за",year," лет:", sum)
        year = year+1
    }
    i = i+1
}
print("---------------------------------------------------------")
