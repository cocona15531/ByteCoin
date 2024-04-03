//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(price: Double)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "1EF61F6C-32BD-4016-A73A-EABE79BA41B6"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        
        //1. Create a URL
        if let url = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)") {
            print(url)
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error)
                    return
                }
                
                let dataAsString = String(data: data!, encoding: .utf8)
//                print(dataAsString)
                
                if let safeData = data {
                    if let bitprice = parseJSON(safeData) {
                        //デリゲートを使っているViewControllerにデータを渡すことができる
                        delegate?.didUpdatePrice(price: bitprice)

                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    

    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            
            print(lastPrice)
            
            return lastPrice
            
        } catch {
            print(error)
            return nil
        }
    }
}
