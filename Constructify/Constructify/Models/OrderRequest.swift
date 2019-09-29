//
//  OrderRequest.swift
//  Constructify
//
//  Created by Earth Maniebo on 29/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import ObjectMapper

public class OrderRequest: Mappable {

    public var pendingRequests: [PendingRequest]!
    public var currentInventory: [CurrentInventory]!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        pendingRequests <- map["pendingRequests"]
        currentInventory <- map["currentInventory"]
        
    }
}


