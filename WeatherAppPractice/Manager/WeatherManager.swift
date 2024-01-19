//
//  WeatherManager.swift
//  WeatherAppPractice
//
//  Created by Arbab Husain on 6/10/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&appid=\("73e98aa0788fd92e0d49059e0a53a305")&units=imperial") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinateResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var wind: WindResponse
    var name: String
}

struct CoordinateResponse: Decodable{
    var lon: Double
    var lat: Double
}

struct WeatherResponse: Decodable{
    var id: Double
    var main: String
    var description: String
    var icon: String
}

struct MainResponse: Decodable{
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct WindResponse: Decodable{
    var speed: Double
    var deg: Double
}


