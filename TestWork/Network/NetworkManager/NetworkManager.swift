//
//  NetworkManager.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    private var defaultURL: String {
        get { "http://94.127.67.113:8099" }
    }
    
    typealias Parameters = [String: Any]
       
    func request(
        parameters: Parameters? = nil,
        method: String = "GET",
        endpoint: String,
        completion: @escaping (Result<Data?, NSError>) -> Void
    ) {
        guard let url = URL(string: "\(defaultURL)/\(endpoint)") else {
            completion(.failure(NSError(domain: "ErrorURL", code: 1, userInfo: [NSLocalizedDescriptionKey: "Incorect URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        
        if let parameters = parameters {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
                completion(.failure(NSError(domain: "ErrorParameters", code: 2, userInfo: [NSLocalizedDescriptionKey: "Incorect Parameters"])))
                return
            }
            
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                completion(.failure(NSError(domain: "Error request", code: 3, userInfo: [NSLocalizedDescriptionKey: "Error request"])))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.success(nil))
            }

        }.resume()
    }
}

extension Data {
    func decode<T : Decodable>(_ type: T.Type) -> T? {
        try? JSONDecoder().decode(type, from: self)
    }
}
