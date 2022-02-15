//
//  ServiceManager.swift
//  sebastian-fornelli
//
//  Created by Sebastián Fornelli on 15/2/22.
//

import Foundation

class ServiceManager {
    public static let shared = ServiceManager()
    
    func callService<T: Decodable>(urlString: String,
                                   httpMethod: HttpVerb,
                                   success: @escaping ((T) -> Void),
                                   failure: @escaping (() -> Void)) {
        let url = URL(string: urlString)
        guard let urlObj = url else { return }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        request.httpMethod = httpMethod.rawValue
        request.addValue("Client-ID \(ManagersConstants.clientID)", forHTTPHeaderField: "Authorization")
        
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
