//
//  CoinData.swift
//  ByteCoin
//
//  Created by Issei Ueda on 2024/03/27.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
