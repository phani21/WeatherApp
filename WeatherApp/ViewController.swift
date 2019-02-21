//
//  ViewController.swift
//  WeatherApp
//
//  Created by IMCS2 on 2/20/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit


var res = ""
class ViewController: UIViewController {
    
    
    @IBOutlet weak var outputField: UITextView!
    @IBOutlet weak var cityname: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
        
        let stringToShow = cityname.text
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=" + stringToShow! + "&appid=4e50d2279e5b4d7501d1092f83ea5345"
        // https://api.openweathermap.org/data/2.5/weather?q=dallas&appid=4e50d2279e5b4d7501d1092f83ea5345
     
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                if let unWrappedData = data {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: unWrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        let weather = jsonResult!["weather"] as? NSArray
                        let weatherItem = weather?[0] as? NSDictionary
                        let description = weatherItem?["description"] as? String?
                        if let res = description {
                           // print(description)
                           // print(res)
                            DispatchQueue.main.async {
                                if( res == nil){
                                    self.outputField.text="Please enter a valid City name! "
                                    self.outputField.backgroundColor = .white
                                    self.outputField.textColor = .red
                                }
                                else{
                                    self.outputField.text = res?.uppercased()
                                    self.outputField.textColor = .black
                                }
                            }
                        }
                    }catch{
                        print("Error fetching API DATA")
                        
                        
                    }
                    
                    
                }
                
            }
        }
        
        task.resume()
        print(res)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "weather.jpeg")!)
    }
    
}
