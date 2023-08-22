//
//  Fruit.swift
//  OrderFood
//
//  Created by Ishwar Shelke on 27/07/23.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    let fruitImageName: String
    let fruitName: String
    let price: Int
    let description: String
}

extension Fruit {
    
    static let fruits = [
        Fruit(fruitImageName: "mango", fruitName: "Mango", price: 200, description: "A mango is a sweet tropical fruit, and it's also the name of the trees on which the fruit grows. Ripe mangoes are juicy, fleshy, and delicious."),
        Fruit(fruitImageName: "guava", fruitName: "Guava", price: 300, description: "The fruits are round to pear-shaped and measure up to 7.6 cm in diameter; their pulp contains many small hard seeds (more abundant in wild forms than in cultivated varieties). The fruit has a yellow skin and white, yellow, or pink flesh."),
        Fruit(fruitImageName: "apple", fruitName: "Apple", price: 150, description: "The apple is one of the pome (fleshy) fruits. Apples at harvest vary widely in size, shape, colour, and acidity, but most are fairly round and some shade of red or yellow. The thousands of varieties fall into three broad classes: cider, cooking, and dessert varieties."),
        Fruit(fruitImageName: "orange", fruitName: "Orange", price: 190, description: "The orange is a usually round or oval citrus; its rind and flesh are generally orange, except the varieties of red pulp. The edible part of the orange is the flesh, consumed in fresh or in juice."),
        Fruit(fruitImageName: "watermelon", fruitName: "Watermelon", price: 100, description: "Watermelon (Citrullus lanatus) is a delicious and refreshing fruit known for its juicy, sweet, and thirst-quenching taste. It is a member of the Cucurbitaceae family, which also includes cucumbers, pumpkins, and squash. Watermelon is believed to have originated in the Kalahari Desert of Africa and has been cultivated for thousands of years."),
    ]
    
}
