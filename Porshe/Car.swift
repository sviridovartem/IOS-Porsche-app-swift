//
//  Car.swift
//  Porshe
//
//  Created by Admin on 14/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Car {
    private var _name:String!
    private var _carId:Int!
    private var _horsePwr:String!
    private var _acceleration:Double!
    private var _topSpeed:Int!
    private var _fuel:Double!
    private var _price:String!
    
    var name:String{return _name}
    var carId:Int{return _carId}
    var horsePower:String{return _horsePwr}
    var acceleration:Double{return _acceleration}
    var topSpeed:Int{return _topSpeed}
    var fuel:Double{return _fuel}
    var price:String{return _price}
    
    init(name:String, carId:Int, horsePower:String, acceleration:Double, topSpeed:Int, fuel:Double, price:String){
        self._name = name
        self._carId = carId
        self._horsePwr = horsePower
        self._acceleration = acceleration
        self._topSpeed = topSpeed
        self._fuel = fuel
        self._price = price
    }
}