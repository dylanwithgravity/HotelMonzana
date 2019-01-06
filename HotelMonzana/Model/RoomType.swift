//
//  RoomType.swift
//  HotelMonzana
//
//  Created by Dylan Williamson on 1/3/19.
//  Copyright © 2019 Dylan Williamson. All rights reserved.
//

import Foundation


struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static var all: [RoomType] {
        return [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
        RoomType(id: 1, name: "One King", shortName: "1K", price: 209),
        RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
}

// Equatable Protocol Implementation for Room Type
func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}
