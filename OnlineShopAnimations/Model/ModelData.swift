//
//  ModelData.swift
//  OnlineShopAnimations
//
//  Created by Maxim Macari on 06/10/2020.
//

import SwiftUI

struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

var bags = [
    BagModel(image: "bag1", title: "Office Bag", price: "234"),
    BagModel(image: "bag2", title: "Stylus Bag", price: "199"),
    BagModel(image: "bag3", title: "Round Belt", price: "159"),
    BagModel(image: "bag4", title: "Belt Bag", price: "239"),
    BagModel(image: "bag5", title: "Hang Top", price: "199"),
    BagModel(image: "bag6", title: "Old Fashion", price: "334")
]

//top scroll
var scrollTabs = ["Hand Bag", "Jewellery", "Footwear", "Dresses", "Beauty"]
