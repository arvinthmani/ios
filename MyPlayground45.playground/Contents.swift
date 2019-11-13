//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let name1 = "Arvinth"

var name2: String?

let name3 = name2 ?? "name1"

print(name3)

for i in 10...20 {
  print(i)
}

let three = 3

let minusthree = -three

var sum = 10-minusthree

sum += minusthree

let names = ["Anna", "Alex", "Brian", "Jack"]


for name in names[...2] {
  print(name)
}

var clos = {(num) -> Int in
  num + 1
}

print(clos(1))

func closAsParam(cl: (Int)->Int) {
  print(cl(1));
}

closAsParam(cl: clos)

print(names.indices)

for i in names.indices {
  print(i)
}

