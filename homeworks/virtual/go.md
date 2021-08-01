# Домашнее задание к занятию "7.5. Основы golang"

https://github.com/netology-code/virt-homeworks/tree/master/07-terraform-05-golang

## Задача 3

## 1) Напишите программу для перевода метров в футы (1 фут = 0.3048 метр).

```text
package main

import "fmt"

func main() {
    fmt.Print("Enter a number: ")
    var input float64
    fmt.Scanf("%f", &input)

    output := input / 0.3048

    fmt.Println(output)    
}
```

## 2) Напишите программу, которая найдет наименьший элемент в любом заданном списке.

```text
package main
import "fmt"

func get_min(x []int) int {
	min := x[0]
	for i := 1; i < len(x)-1; i++ {
    if x[i] < min {
      min = x[i]
    }
	}
	return min;
}

func main() {
  x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
  fmt.Println(get_min(x)); 
}
```

## 3) Напишите программу, которая выводит числа от 1 до 100, которые делятся на 3. То есть (3, 6, 9, …).

```text
package main

import "fmt"

func mult_of_three(max int) []int {
  var arr []int
	for i := 1; i < max; i++ {
        if i % 3 == 0 {
          arr = append(arr, i)
        }
	}
	return arr;
}

func main() {
  max := 100
	fmt.Println(mult_of_three(max)); 
}
```

