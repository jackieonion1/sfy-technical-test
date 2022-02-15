//
//  ServiceManager.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import Foundation

class ServiceManager {
    public static let shared = ServiceManager()
    
    func callService<T: Decodable>(urlString: String, success: @escaping ((T) -> Void), failure: @escaping (() -> Void)) {
        let url = URL(string: urlString)
        guard let urlObj = url else { return }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            guard error == nil else { return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(T.self, from: data) {
                success(json)
            } else {
                failure()
            }
        })
        task.resume()
    }
}
