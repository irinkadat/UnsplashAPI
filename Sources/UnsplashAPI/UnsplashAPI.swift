import Foundation

public class UnsplashAPI {
    public let apiKey: String
    private let networkService: NetworkService
    
    public init(apiKey: String, networkService: NetworkService) {
        self.apiKey = apiKey
        self.networkService = networkService
    }
    
    public func fetchPhotos(page: Int, perPage: Int, completion: @escaping ([UnsplashPhoto]?, Error?) -> Void) {
        let urlString = "https://api.unsplash.com/photos"
        guard var urlComponents = URLComponents(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: apiKey),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "per_page", value: String(perPage))
        ]
        guard let url = urlComponents.url else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        networkService.fetchData(from: url) { data, error in
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
        }
    }
}


