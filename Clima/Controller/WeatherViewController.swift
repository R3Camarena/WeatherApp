//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self //To assign UITextFieldDelegate to the searchTextField
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // To dismiss the keyboard
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // Detects if the user pressed the return button in the keyboard
        searchTextField.endEditing(true) // To dismiss the keyboard
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something here" // Alert the user if they havn't typed anything in the search field
            return false
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = "" // To empty the search field once the search button or the return key are pressed
    }
    
}

