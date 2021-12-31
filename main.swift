//
//  main.swift
//  Menu
//
//  Created by Ghada on 26/12/2021.
//

import Foundation
var meal: String?
var allergic: String?
var Vegan: String?
var current_dish :[String]

struct dish {
    var name: String = ""
    var isAllergic: Bool = false
    var isVegan: Bool = false
    var price: Int = 0
    
    
    
}

// Dish, allergy? y/n, Vegan? y/n
let breakfast = ["Omlet,y,n,15","Pancake,y,n,15","Falafel,n,y,5","Labna,n,n,7", "Fried eggs with toast,y,n,12", "cerial with almond milk,n,n,10"]
let lunch = ["Chicken Burger,n,n,25","beef Burger,n,n,30","Veggie Sandwitch,n,y,27","Salad,n,y,20", "Curry with white rice,y,n,35"]
let dinner = ["Basta,n,y,35","Pizza,n,y,30", "Steak,n,n,40", "Tacos,n,n,25", "Curry with white rice,y,n,27"]
var breakfast_array: [dish] = []
var lunch_array: [dish] = []
var dinner_array: [dish] = []
var test: [String]

func creatDish (_ category: [String]){
    var current_dish: [String]
    var isAllergic: Bool
    var isVegan: Bool
    for x in category{
       current_dish = x.components(separatedBy: ",")
        if current_dish[1]=="n"{
            isAllergic = false
        }
        else{
            isAllergic = true
    }
    
    if current_dish[2]=="n"{
        isVegan = false
    }
        else{
        isVegan = true
}
        
        let price = Int(current_dish[3]) ?? 0
        let new_dish = dish(name: current_dish[0], isAllergic: isAllergic, isVegan: isVegan, price: price)
        switch category{
        case breakfast:
            breakfast_array.append(new_dish)
            break
        case lunch:
            lunch_array.append(new_dish)
            break
        case dinner:
            dinner_array.append(new_dish)
            break
        default:
            break
        }
    }
}

print("----------------------------------")
print("Ghada's Resturant")
print("----------------------------------")
print("Hello, Customer!")
print("what do you want to order?")
print ("""
1- Breakfast
2- Lunch
3- Dinner
""")
var input_meal: String?
if let input = readLine (){
    input_meal = input
    switch input{
case "1":
        meal = "Breakfast"
        break;
case "2":
        meal = "Lunch"
        break;
case "3":
        meal = "Dinner"
        break;
    default:
        print ("Have a nice meal!")
    }
    
}

print ("Are you allergic to nuts, eggs, or any other food? (y/n)")
    if let inputAlergic = readLine(){
        if inputAlergic == "y"{
            allergic = "y"
    }
        else{
            allergic = "n"
    }
    }
print ("Are you Vegan?(y/n)")
    if let inputVegan = readLine(){
        if inputVegan == "y"{
            Vegan = "y"
    }
        else{
            Vegan = "n"
    }
    }
    
if meal == "Breakfast"{
    creatDish(breakfast)
    printMenu(breakfast_array)
}

if meal == "Lunch"{
    creatDish(lunch)
    printMenu(lunch_array)
}

if meal == "Dinner"{
    creatDish(dinner)
    printMenu(dinner_array)
}


func printMenu (_ menu:[dish]) {
   var x = 1

   for dish in menu {
       if (allergic == "n" && Vegan == "n"){
           print (x,"-",dish.name,"Price:",dish.price)
           x+=1
       }
       else if(allergic == "y" && Vegan == "n"){
           if (dish.isAllergic == false){
               print (x,"-",dish.name,"Price:",dish.price)
               x+=1
               }
       }
       else if(allergic == "y" && Vegan == "y"){
           if (dish.isAllergic == false && dish.isVegan == true){
               print (x,"-",dish.name,"Price:",dish.price)
               x+=1
               }
       }
       else if(allergic == "n" && Vegan == "y"){
           if ( dish.isVegan == true){
               print (x,"-",dish.name,"Price:",dish.price)
               x+=1
               }
       }
       
      }
        
}

print("Please type the dishs you would like to order seperated by comma")
if let input = readLine(){
       calculateBill(input)
}

func calculateBill(_ order: String){
    var totalPrice: Int = 0
    let orderList: [String] = order.components(separatedBy: ",")
    switch input_meal{
    case "1":
        for y in orderList{
     
        for x in breakfast_array {
            if x.name == y{
                totalPrice += x.price
            }
        }
        }
            break;
    case "2":
        for y in orderList{
     
        for x in lunch_array {
            if x.name == y{
                totalPrice += x.price
            }
        }
        }
            break;
    case "3":
        for y in orderList{
     
        for x in dinner_array {
            if x.name == y{
                totalPrice += x.price
            }
        }
        }
            break;
    default:
        print("")
    
    }
    
    print("Your bill is:",totalPrice)
    
}



