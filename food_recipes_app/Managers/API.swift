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
     
}
