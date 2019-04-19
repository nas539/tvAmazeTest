//
//  structsForTVAmaze.swift
//  tvAmazeTest
//
//  Created by MCS on 4/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct TVAmazeVars: Decodable {
    var _embedded: [Embedded]
    var name: String
}

struct Embedded: Decodable {
    var episodes: [Episodes]
}
struct Episodes: Decodable {
    var name: String?
    var season: Int
    var number: Int
    var airdate: String
    var airtime: String
    var summary: String?
}

