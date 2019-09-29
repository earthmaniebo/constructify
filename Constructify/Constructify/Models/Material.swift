//
//  Material.swift
//  Constructify
//
//  Created by Earth Maniebo on 29/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//



import ObjectMapper

public class Material: Mappable {

    public var id: Int!
    public var name: String!
    public var initialQuantity: Int!
    public var currentQuantity: Int!
    public var materialClass: MaterialClass!
    public var status: Int!
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        initialQuantity <- map["initialQuantity"]
        currentQuantity <- map["currentQuantity"]
        materialClass <- map["materialClass"]
        status <- map["status"]
    }
}
