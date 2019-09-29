//
//  PendingRequest.swift
//  Constructify
//
//  Created by Earth Maniebo on 29/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import ObjectMapper

public class PendingRequest: Mappable {

    public var id: Int!
    public var areaName: String!
    public var requestedDate: String!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        areaName <- map["areaName"]
        requestedDate <- map["requestedDate"]
    }
}

