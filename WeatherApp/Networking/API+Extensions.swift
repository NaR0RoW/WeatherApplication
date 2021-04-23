import Foundation

struct API {
    
    static let key = "9898f76611dba534c9d721073a297ccf"
}

extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"

    // Возвращает погоду по данной ширине и долготе
    static func getURLFor(lat: Double, lon: Double) -> String {
        
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}
