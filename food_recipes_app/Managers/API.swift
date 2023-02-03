//
//  API.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/31/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import Foundation

struct Constants {
    static let baseURL = "https://starlit-salamander-3b2fd0.netlify.app/api"
}

enum APIError: Error {
    case failedTogetData
}

class API {
    static let shared = API()
    
    func getChineseFoodData(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/foods/cuisine/Chinese") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode([FoodsDataModels].self, from: data)
                completion(.success(results))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    
    func login(username: String, password: String, completion: @escaping (Result<[UserDataModels], Error>) -> Void) {
            // Define the API endpoint
            guard let url = URL(string: "\(Constants.baseURL)/user/email/") else {return}
            // Create the request with the login parameters
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            let parameters = "username=\(username)&password=\(password)"
            request.httpBody = parameters.data(using: .utf8)
            
            // Send the request with URLSession
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    // Parse the response data to determine if the login was successful
                    // ...
                    
//                    completion(.success(true))
                } else {
                    completion(.failure(NSError(domain: "com.example.login", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                }
            }
            
            task.resume()
        }
     
}
