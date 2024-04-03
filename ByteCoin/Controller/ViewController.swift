//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManeger = CoinManager()
    let requestURL = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=1EF61F6C-32BD-4016-A73A-EABE79BA41B6"


    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinManeger.delegate = self
    }

}

//MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManeger.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManeger.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(coinManeger.currencyArray[row])
        coinManeger.getCoinPrice(for: coinManeger.currencyArray[row])

    }
}

extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(price: Double) {
        //UIの更新を行う
        //bitcoinLabelとcurrencyLabelの更新を行う
    }
    
    func didFailWithError(error: any Error) {
        <#code#>
    }
    
    
}

