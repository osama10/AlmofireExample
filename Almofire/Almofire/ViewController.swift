//
//  ViewController.swift
//  Almofire
//
//  Created by Admin on 8/22/17.
//  Copyright © 2017 Mujadidia Inc. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource , RemoteDataServiceProtocol{
    
    @IBOutlet weak var tableView : UITableView!
    var weatherData : WeatherData?
    
    let remoteDataService = RemoteDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        remoteDataService.delegate =  self
        remoteDataService.getDataFromWeatherApi()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return getTotalRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let timeStamp  = Double((weatherData?.weatherDataList?[indexPath.row].dt)!)
        
        cell?.textLabel?.text = DateTimeServices.getDateStringFrom(timeStamp: timeStamp)
        
        let description =   weatherData?.weatherDataList?[indexPath.row].weatherList?[0].description
        
        cell?.detailTextLabel?.text = description!
        
        return cell!
    }
    
    private func getTotalRows()->Int{
        
        if( weatherData?.weatherDataList?.count == nil){
            
            return 0
        }
        
        return (weatherData?.weatherDataList?.count)!
        
    }
    
    func sentResponse(response: Response) {
        
        weatherData = response.weatherData
        tableView.reloadData()
    }
}

