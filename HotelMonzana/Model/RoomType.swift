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
    var price: Double
}

// Equatable Protocol Implementation for Room Type
func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}
