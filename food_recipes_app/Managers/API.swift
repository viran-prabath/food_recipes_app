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
    
    //Get Chinese Food From Home Page
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
    
    //Get Indian Food From Home Page
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
    
    //Get Italian Food From Home Page
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
    
    //Get Japanese Food From Home Page
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
    
    //Get Thai Food From Home Page
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
    
    //Get American Food From Home Page
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
    
    
    
    //Load all food Data
    func getSearchFood(completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/foods") else {return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do{
                    let results = try JSONDecoder().decode([FoodsDataModels].self, from: data)
                    completion(.success(results))
                    print(results)
                } catch{
                    completion(.failure(APIError.failedTogetData))
                }

            }
            task.resume()
        }
    
    
    //Search Food Data
    func search(with query: String, completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
        print("This is =\(query)")
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseURL)/foods/\(query)") else { return }
       // print("\(url)")

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do{
                let results = try JSONDecoder().decode(FoodsDataModels.self, from: data)
                print(results)
                completion(.success([results]))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }

        task.resume()
    }
    
    
    //Get Selected Food Details
    func getSelectedFood(with query: String, completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {

            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            guard let url = URL(string: "\(Constants.baseURL)/foods/\(query)") else {return}
            print("This is URL \(url)")
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(FoodsDataModels.self, from: data)
                  //  print("This is Result \(results)")
                    completion(.success([results]))
                    

                } catch {
                    completion(.failure(error))
                }

            }
            task.resume()
        }
    
    //Add Favorite Data To table
    static func addToFavorite(userId: String, foodId:String, completion: @escaping (Result<Void, Error>) -> Void) {
            // Build the API request
            let url = URL(string: "\(Constants.baseURL)/favorites")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters = ["userId": userId, "foodId": foodId]
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
            
            // Send the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                do {
                    // Parse the response
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    let massage: String = String(data: data, encoding: .utf8)!
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
            }
            task.resume()
        }
    
    
    //Search Favorite Foods By UserID
        func searchFavFoodsByUserId(with query: String, completion: @escaping (Result<[FoodsDataModels], Error>) -> Void) {
            print("This is =\(query)")
            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
            guard let url = URL(string: "\(Constants.baseURL)/favorites/\(query)") else { return }
            print("\(url)")

            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do{
                    let results = try JSONDecoder().decode([FoodsDataModels].self, from: data)
                    //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    print(results)
                    completion(.success(results))
                } catch{
                    completion(.failure(APIError.failedTogetData))
                }
            }

            task.resume()
        }
    
    
    //SignUp Page
    static func signUp(fname: String, lname:String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            // Build the API request
            let url = URL(string: "https://starlit-salamander-3b2fd0.netlify.app/api/user")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters = ["first_name": fname, "last_name": lname, "email": email, "password": password]
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

            // Send the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                            let statusCode = (response as! HTTPURLResponse).statusCode
                            if statusCode >= 200 && statusCode < 300 {
                                completion(.success(()))
                                print("Status Code:\(statusCode)")
                                let UID: String = String(data: data, encoding: .utf8)!
                                let originalString = "\"\(UID)\""
                                let modifiedString = originalString.replacingOccurrences(of: "\"", with: "")
                                UserDefaults.standard.set(modifiedString, forKey: "userID")
                            } else {
                                let error = NSError(domain: "API", code: statusCode, userInfo: nil)
                                completion(.failure(error))
                            }
                    }
                    catch{print("error")}
                }
                
                
            }
            task.resume()
        }
    
    
    //Login Page
    static func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            // Build the API request
            let url = URL(string: "https://starlit-salamander-3b2fd0.netlify.app/api/user/userdata")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters = ["email": email, "password": password]
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

            // Send the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                            // Parse the response
                            let statusCode = (response as! HTTPURLResponse).statusCode
                            if statusCode >= 200 && statusCode < 300 {
                                completion(.success(()))
                                print("Status Code:\(statusCode)")
                                let UID: String = String(data: data, encoding: .utf8)!
                                let originalString = "\"\(UID)\""
                                let modifiedString = originalString.replacingOccurrences(of: "\"", with: "")
                                UserDefaults.standard.set(modifiedString, forKey: "userID")
                            } else {
                                let error = NSError(domain: "API", code: statusCode, userInfo: nil)
                                completion(.failure(error))
                            }
                    }
                    catch{print("error")}
                    
                    return
                }
                
                
            }
            task.resume()
        }
    
     
}

