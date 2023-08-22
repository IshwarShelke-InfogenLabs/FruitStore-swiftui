//
//  Location.swift
//  OrderFood
//
//  Created by Ishwar Shelke on 27/07/23.
//

import SwiftUI

struct Shop: Identifiable {
    let id = UUID()
    let locationImage: String
    let shopName: String
    let timing: String
    let rating: Int
    let distance: Int
}

struct ShopList {
    
    static let shops = [
        Shop(locationImage: "fruit-shop1",shopName: "From the Land",timing: "11am - 5pm",rating: 4, distance: 5),
        Shop(locationImage: "fruit-shop2",shopName: "Farmer's Shop",timing: "8am - 7pm",rating: 3, distance: 1),
        Shop(locationImage: "fruit-shop3",shopName: "Farm Fresh Fruits",timing: "9am - 7pm",rating: 5, distance: 2),
        Shop(locationImage: "fruit-shop4",shopName: "Fruit Factory",timing: "10am - 8pm",rating: 4, distance: 4),
        Shop(locationImage: "fruit-shop5",shopName: "Fruits King",timing: "10am - 9pm",rating: 1, distance: 3),
        Shop(locationImage: "fruit-shop1",shopName: "Daily Fresh",timing: "10am - 6pm",rating: 2, distance: 2),
    ]
    
}
