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
    
    func getIndianFoodData(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/foods/cuisine/Indian") else {return}
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
    
    func getItalianFoodData(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/foods/cuisine/Italian") else {return}
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
    
    func getJapaneseFoodData(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/foods/cuisine/Japanese") else {return}
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
    
    func getThaiFoodData(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/foods/cuisine/Thai") else {return}
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
    
    func getAmericanFoodData(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/foods/cuisine/American") else {return}
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
    
    static func signUp(userid: String, fname: String, lname:String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            // Build the API request
            let url = URL(string: "https://starlit-salamander-3b2fd0.netlify.app/api/user")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters = ["userId": userid, "first_name": fname, "last_name": lname, "email": email, "password": password]
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

            // Send the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                do {
                        // Parse the response
                        let statusCode = (response as! HTTPURLResponse).statusCode
                        
                        print("Status Code:\(statusCode)")
                        
                        if statusCode >= 200 && statusCode < 300 {
                            completion(.success(()))
                        } else {
                            let error = NSError(domain: "API", code: statusCode, userInfo: nil)
                            completion(.failure(error))
                        }
                }
                catch{print("error")}
            }
            task.resume()
        }
    
     
}
