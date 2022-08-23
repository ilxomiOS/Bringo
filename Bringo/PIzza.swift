//
//  PIzza.swift
//  Bringo
//
//  Created by Ilxom on 23/08/22.
//

import Foundation

struct Pizzas {
    let pizza: String
    
    static func getPizzasData() -> [Pizzas] {
        [
            Pizzas(pizza: "Margarita"),
            Pizzas(pizza: "Peperoni")
        ]
    }
}
