//
//  NetworkManager.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 27.03.2023.
//

import Foundation

class NetworkManager {

    let urlSession = URLSession.shared

    func getWheater(coordinates: [Double:Double] = [54.9924:73.3686], complition: @escaping (_ forecast : Wheather) -> ()) {

        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=54.9924&lon=73.3686&hours=true") else { return }

        var request = URLRequest(url: url)
        request.addValue("cdb1cf02-d38f-4913-852e-af24e6951369", forHTTPHeaderField: "X-Yandex-API-Key")

        let task = urlSession.dataTask(with: request) { data, response, error in

            guard let data else { return }

            do {
                let result = try JSONDecoder().decode(Wheather.self, from: data)
                complition(result)
            } catch {
                print(error)
            }

        }
        task.resume()
    }
}
