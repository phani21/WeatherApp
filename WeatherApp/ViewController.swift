//
//  ViewController.swift
//  WeatherApp
//
//  Created by IMCS2 on 2/20/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var outputField: UITextView!
    @IBOutlet weak var cityname: UITextField!
   
    @IBAction func submitButton(_ sender: Any) {
   
    let stringToShow = cityname.text
    let newStringToShow = stringToShow?.replacingOccurrences(of: " ", with: "-")
    let urlString = "https://www.weather-forecast.com/locations/" + newStringToShow! + "/forecasts/latest"
   // let search = "p class=\"b-forecast__table-description-content\">"
    let url = URL(string: urlString)
    
    do {
    let contents = try String(contentsOf: url!)
    
    } catch {
    outputField.text="Please enter a valid City name! "
    outputField.backgroundColor = .white
    outputField.textColor = .red
    }
   
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "weather.jpeg")!)
    }


}

