import Foundation

public class UnsplashAPI {
    private let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func fetchPhotos(completion: @escaping ([UnsplashPhoto]?, Error?) -> Void) {
        let urlString = "https://api.unsplash.com/photos"
        guard var urlComponents = URLComponents(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: apiKey)]
        guard let url = urlComponents.url else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let photos = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
                completion(photos, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

public struct UnsplashPhoto: Decodable {
    let id: String
    let urls: URLs
}

public struct URLs: Decodable {
    let regular: URL
}
