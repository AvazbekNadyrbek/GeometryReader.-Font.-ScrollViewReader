//
//  Product.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 04.09.25.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    let id: Int
    let title: String
    let badge: String
    let price: String
    let imageName: String

    static let samples: [Product] = (1...8).map { i in
        .init(id: i, title: "Nike Air Max \(i)", badge: "Best Seller", price: "₽\(700 + i * 10).00", imageName: "footImg")
    }
}
