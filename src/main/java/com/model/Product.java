 package com.model;

public class Product {

int id;

String name,category;

double price;

int quantity;

public int getId(){
return id;
}

public void setId(int id){
this.id=id;
}

public String getName(){
return name;
}

public void setName(String name){
this.name=name;
}

public String getCategory(){
return category;
}

public void setCategory(String category){
this.category=category;
}

public double getPrice(){
return price;
}

public void setPrice(double price){
this.price=price;
}

public int getQuantity(){
return quantity;
}

public void setQuantity(int quantity){
this.quantity=quantity;
}

}