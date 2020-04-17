//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Kaloyan Aleksiev on 18/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Decodable {
    var rate: Double
    var asset_id_quote: String
}
