//
//  Movies.swift
//  MoviesApp
//
//  Created by Tuba Nur  on 3.08.2023.
//

import Foundation

class Movies{
    var id: Int?
    var name:String?
    var image:String?
    var pay:Int?
    init(){
        
    }
    init(id: Int? = nil, name: String? = nil, image: String? = nil, pay: Int? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.pay = pay
    }
}
