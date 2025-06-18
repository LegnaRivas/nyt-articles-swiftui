//
//  NYTAPIService.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation

final class NYTAPIService {
    static let shared = NYTAPIService()
    private init() {}

    private let apiKey = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"

    func fetchPopularArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 500)))
                return
            }

            do {
                let result = try JSONDecoder().decode(NYTResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

// Estructura raíz del JSON
private struct NYTResponse: Codable {
    let results: [Article]
}
