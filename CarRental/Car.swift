//
//  Car.swift
//  CarRental
//
//  Created by Onurcan Sever on 2021-10-22.
//

import Foundation

class Car {
    var carBrand: String
    var carDetails: [CarModel]
    
    init(carBrand: String, carDetails: [CarModel]) {
        self.carBrand = carBrand
        self.carDetails = carDetails
    }
}

struct CarModel {
    let carModel: String
    let carPhoto: String
    let carDailyRate: Double
    let carDescription: String
    let carMileage: Double
}
