//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Andrey on 5/5/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct Place {
    var name: String
    var location: String
    var type: String
    var image: String
    
}

let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]

func getPlaces() -> [Place] {
    
    var places = [Place]()
    
    for place in restaurantNames {
        places.append(Place(name: place, location: "Dnepr", type: "Restaurant", image: place))
    }
    
    return places
}
