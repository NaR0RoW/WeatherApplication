import Foundation

struct API {
    
    static let key = ""
}

extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"

    // Возвращает погоду по данной ширине и долготе
    static func getURLFor(lat: Double, lon: Double) -> String {
        
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}
