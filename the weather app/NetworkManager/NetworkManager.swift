//
//  NetworkManager.swift
//  the weather app
//
//  Created by сииас on 19/09/2023.
//

import Foundation

class NetworkManager {
    private init() {}
    
    static let shared: NetworkManager = NetworkManager()
    
    func getWeather(city: String, result: @escaping ((OfferModel?) -> ())) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: "2a731deef39ff90d5b70740ab136d08b")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                var decoderOfferModel: OfferModel?
                
                if let data = data {
                    decoderOfferModel = try? decoder.decode(OfferModel.self, from: data)
                }
                
                result(decoderOfferModel)
            } else {
                print(error as Any)
                result(nil)
            }
        }.resume()
    }
}
