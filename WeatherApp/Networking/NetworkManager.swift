import Foundation


final class NetworkManager<T: Codable> {
    
    static func fetch(for url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Обработка теоретических ошибок
            // Какая-то ошибка
            guard error == nil else {
                
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            // Неверный запрос
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                
                completion(.failure(.invalidResponse))
                return
            }
            
            // Неверная дата
            guard let data = data else {
                
                completion(.failure(.invalidData))
                return
            }
            
            // Если прошли все варианты ошибок и все работает, то тогда
            do {
                
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            
            } catch let err {
                
                print(String(describing: err))
                completion(.failure(.decodinError(err: err.localizedDescription)))
            }
        }
        .resume()
    }
}


enum NetworkError: Error {
    
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodinError(err: String)
}
