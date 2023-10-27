//
//  ChargeModel.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct ChargeModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [ChargeItem]
}

struct ChargeItem: Codable, Hashable {
    
    var id: Int?
    var categoryId: Int?
    var title: String?
    var image: String?
    var video: String?
    
    var duration: Int?
}
