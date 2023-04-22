//
//  Products.swift
//  23.0_HappyHangerApp
//
//  Created by Apple  on 12/04/23.
//

import Foundation

class Products:Codable{
    var id:Int?
    let title:String
    let price:Double
    let description:String
    let images:[URL]?
    let category:Category
}
