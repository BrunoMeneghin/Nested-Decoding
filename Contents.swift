import UIKit

guard let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22") else {
    fatalError("The URL is invalid")
}

struct Weather: Decodable {
    let main: String
    let description: String
}

struct WeatherResponse: Decodable {
    let weather: [Weather]
}

URLSession.shared.dataTask(with: url) { data, response, error in

    guard let data = data, error == nil else {
        return
    }
    
    let result = try? JSONDecoder().decode(WeatherResponse.self, from: data)
    
    if let result = result {
        print(result)
        
        result.weather.forEach {
            print($0.main)
            print($0.description)
           
        }
    }
    
}.resume()
