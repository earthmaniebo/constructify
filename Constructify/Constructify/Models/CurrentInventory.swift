//
//  CurrentInventory.swift
//  Constructify
//
//  Created by Earth Maniebo on 29/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import ObjectMapper

public class CurrentInventory: Mappable {

    public var className: String!
    public var materials: [Material]!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        className <- map["className"]
        materials <- map["materials"]
    }
}


