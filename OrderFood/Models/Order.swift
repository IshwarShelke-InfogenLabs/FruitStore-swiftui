//  Order.swift
//  OrderFood
//
//  Created by Ishwar Shelke on 28/07/23.

import SwiftUI


struct Order: Identifiable, Codable, Equatable {
    var id = UUID()
    var itemImage: String
    var itemName: String
    var quantityInKG: Int
    var finalPrice: Int
}


extension Order {
    static var emptyOrder: Order{
        Order(itemImage: "", itemName: "", quantityInKG: 0, finalPrice: 0)
    }
}

extension Order {
    static let sampleData: [Order] =
    [
        Order(itemImage: "mango", itemName: "Mango", quantityInKG: 1, finalPrice: 200),
        Order(itemImage: "apple", itemName: "Apple", quantityInKG: 1, finalPrice: 150),
        Order(itemImage: "orange", itemName: "Orange", quantityInKG: 1, finalPrice: 190),
    ]
}
