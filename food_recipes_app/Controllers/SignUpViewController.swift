//
//  SignUpViewController.swift
//  food_recipes_app
//
//  Created by MacOs12 on 2023-02-03.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    
    private let useridTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "User ID"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           return textField
       }()
    
    private let fnameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "First Name"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           return textField
       }()
    
    private let lnameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Last Name"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           return textField
       }()
       
       private let usernameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Email"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           return textField
       }()

       private let passwordTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Password"
           textField.borderStyle = .roundedRect
           textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
           textField.layer.borderWidth = 0.5
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.backgroundColor = UIColor.systemBackground.cgColor
           textField.layer.cornerRadius = 5
           textField.isSecureTextEntry = true
           return textField
       }()
       
       private let signUpButton: UIButton = {
           let button = UIButton()
           button.setTitle("Sign Up", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = .systemBlue
           button.layer.cornerRadius = 5
           return button
       }()
       
       private let loginButton: UIButton = {
           let button = UIButton()
           button.setTitle("Log In", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = .systemGray
           button.layer.cornerRadius = 5
           return button
       }()
       
       private let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Recipe Master"
           label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
           label.textColor = .systemGray
           return label
       }()
       
       

       override func viewDidLoad() {
           super.viewDidLoad()
           self.view.backgroundColor = .systemBackground
       
           self.view.addSubview(titleLabel)
           self.view.addSubview(useridTextField)
           self.view.addSubview(fnameTextField)
           self.view.addSubview(lnameTextField)
           self.view.addSubview(usernameTextField)
           self.view.addSubview(passwordTextField)
           self.view.addSubview(signUpButton)
           self.view.addSubview(loginButton)
           
           
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           useridTextField.translatesAutoresizingMaskIntoConstraints = false
           fnameTextField.translatesAutoresizingMaskIntoConstraints = false
           lnameTextField.translatesAutoresizingMaskIntoConstraints = false
           usernameTextField.translatesAutoresizingMaskIntoConstraints = false
           passwordTextField.translatesAutoresizingMaskIntoConstraints = false
           signUpButton.translatesAutoresizingMaskIntoConstraints = false
           loginButton.translatesAutoresizingMaskIntoConstraints = false
           
       

           NSLayoutConstraint.activate([
      
               titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
               titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               titleLabel.heightAnchor.constraint(equalToConstant: 44),

               
               useridTextField.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200),
               useridTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               useridTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               
               fnameTextField.topAnchor.constraint(equalTo: useridTextField.bottomAnchor,constant: 10),
               fnameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               fnameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               
               lnameTextField.topAnchor.constraint(equalTo: fnameTextField.bottomAnchor,constant: 10),
               lnameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               lnameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               
               usernameTextField.topAnchor.constraint(equalTo: lnameTextField.bottomAnchor, constant: 10),
               usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

               passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
               passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
           
               signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
               signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               signUpButton.heightAnchor.constraint(equalToConstant: 44),
               
               loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10),
               loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
               loginButton.heightAnchor.constraint(equalToConstant: 44),
           ])
           signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
          // loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
       }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
       let userid = useridTextField.text!
       let fname = fnameTextField.text!
       let lname = lnameTextField.text!
       let email = usernameTextField.text!
       let password = passwordTextField.text!

        API.signUp(userid: userid, fname: fname, lname:lname, email: email, password: password) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Success", message: "Sign-up successful!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            
            }
        }
    }
    
    
    
    
    
    
    
    
       
//       @objc func signupButtonTapped() {
//
//          let userid = useridTextField.text!
//          let fname = fnameTextField.text!
//          let lname = lnameTextField.text!
//          let email = usernameTextField.text!
//          let password = passwordTextField.text!
//
//
//           let url = URL(string: "https://starlit-salamander-3b2fd0.netlify.app/api/user")!
//
//           let payload = ["userId": userid, "first_name": fname, "last_name": lname, "email": email, "password": password]
//           let data = try! JSONSerialization.data(withJSONObject: payload, options: [])
//
//           var request = URLRequest(url: url)
//           request.httpMethod = "POST"
//           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//           request.httpBody = data
//
//           let task = URLSession.shared.dataTask(with: request) { data, response, error in
//               if let error = error {
//                   print("Error: \(error)")
//                   return
//               }
//
//               guard let data = data else {
//                   print("No data received")
//                   return
//               }
//
//
//
//
//
//
//             do{
//                   let json = try! JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                   print(json)
//              }catch{
//
//              }
//           }
//
//           task.resume()
//
//
//       }
    
    
    
    
    
    
    
    
    
    
    
       
//       @objc func loginButtonTapped() {
////           let loginViewController = LoginViewController()
//           UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
//                 UIApplication.shared.windows.first?.rootViewController = loginViewController
//             }, completion: nil)
//       }
    


}
