//
//  CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by Kaloyan Aleksiev on 18/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didUpdateRate(_ coinManager: CoinManager, coinModel: CoinModel)
    
    func didFailWithError(error: Error)
}
