//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let coinURL = "\(baseURL)/\(currency)/?apikey=60C557A9-6261-4F8E-BEF9-E6E048A75182"
        performRequest(with: coinURL)
    }

    func performRequest(with coinURL: String) {
        if let url=URL(string: coinURL){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url){ (data, urlResponce, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData=data{
                    if let exchangeRateData=self.parseJSON(safeData){
                        self.delegate?.didUpdateRate(self, coinModel: exchangeRateData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinModel.self, from: data)
            return decodedData
        } catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
