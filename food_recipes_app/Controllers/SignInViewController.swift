//
//  SignInViewController.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController {

   let titleLabel : UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .systemFont(ofSize: 30, weight: .bold)
                label.textAlignment = .center
                return label
            }()
            
            let descriptionLabel : UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .systemFont(ofSize: 16)
                label.textAlignment = .center
                return label
            }()
            
            let txtusername : UITextField = {
               let txtuser = UITextField()
                txtuser.translatesAutoresizingMaskIntoConstraints = false
                txtuser.borderStyle = .roundedRect
                txtuser.heightAnchor.constraint(equalToConstant: 40).isActive = true
                txtuser.widthAnchor.constraint(equalToConstant: 300).isActive = true
                txtuser.layer.cornerRadius = 10
                txtuser.layer.borderWidth = 1
                txtuser.layer.borderColor = UIColor.black.cgColor
                return txtuser
            }()
            
            let txtpassword : UITextField = {
               let txtpass = UITextField()
                txtpass.translatesAutoresizingMaskIntoConstraints = false
                txtpass.borderStyle = .roundedRect
                txtpass.heightAnchor.constraint(equalToConstant: 40).isActive = true
                txtpass.widthAnchor.constraint(equalToConstant: 300).isActive = true
                txtpass.layer.cornerRadius = 10
                txtpass.layer.borderWidth = 1
                txtpass.layer.borderColor = UIColor.black.cgColor
                txtpass.isSecureTextEntry = true
                return txtpass
            }()
            
            let viewHolderMain : UIStackView = {
                let stack = UIStackView()
                stack.axis = .vertical
                stack.spacing = 20
                stack.alignment = .center
                stack.translatesAutoresizingMaskIntoConstraints = false
                return stack
            }()
        
        let btnSignIn : UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
            btn.layer.cornerRadius = 20
            btn.setTitle("Sign In", for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
            btn.setTitleColor(.white, for: .normal)
            btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
            btn.backgroundColor = UIColor.blue
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.black.cgColor
            //btn.frame = CGRect(x: 10, y: 50, width: 100, height: 30)
            btn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
            return btn
        }()
    
        let btnSignUp : UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
            btn.layer.cornerRadius = 20
            btn.setTitle("Sign Up", for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
            btn.setTitleColor(.white, for: .normal)
            btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
            btn.backgroundColor = UIColor.gray
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.black.cgColor
            //btn.frame = CGRect(x: 10, y: 50, width: 100, height: 30)
            btn.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
            return btn
        }()
    
    
//    @objc func logind() {
//
//
//            if txtusername.text?.isEmpty == true || txtpassword.text?.isEmpty == true
//            {
//                let alert = UIAlertController(title: "Warning", message: "Username or Password is empty", preferredStyle: .alert)
//                let action = UIAlertAction (title: "OK", style: .default, handler: nil)
//                alert.addAction(action)
//                self.present(alert, animated: true, completion: nil)
//            }
//            else
//            {
//
//
//            }
//
//        }
    
    @objc func loginAction()
    {
        guard let email = txtusername.text, let password = txtpassword.text else {return}
        
        let parameters: [String: Any] = ["email": "\(email)", "password": "\(password)"]
        
        AF.request("https://starlit-salamander-3b2fd0.netlify.app/api/user/userdata", method: .post, parameters: parameters).responseJSON{
            response in
            
            switch response.result{
            case.success(let value):
                print(value)
            case.failure(let error):
                print(error)
            }
        }
    }
        
           @objc func pressed() {
            let alert = UIAlertController(title: "Alert", message: "Hi Foodies", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
           }
    
            @objc func goToNextPage() {
                    let signUp = SignUpViewController()
                    show(signUp, sender: self)
                }
            
            func assignbackground(){
                let background = UIImage(named: "signinbackground")

                var imageView : UIImageView!
                imageView = UIImageView(frame: view.bounds)
                imageView.contentMode =  .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.image = background
                imageView.center = view.center
                view.addSubview(imageView)
                self.view.sendSubviewToBack(imageView)
            }
        
            override func viewDidLoad() {
                super.viewDidLoad()
                self.view.backgroundColor = .white
                //assignbackground()
                let apperence = UINavigationBarAppearance()
                apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                navigationItem.standardAppearance = apperence
                self.navigationController?.navigationBar.prefersLargeTitles = true
                titleLabel.text = "Login"
                descriptionLabel.text = "Welcome back to Tasty Foods Recepies!"
                txtusername.placeholder = "Username"
                txtpassword.placeholder = "Password"
                
                viewHolderMain.insertArrangedSubview(titleLabel, at: 0)
                viewHolderMain.insertArrangedSubview(descriptionLabel, at: 1)
                viewHolderMain.insertArrangedSubview(txtusername, at: 2)
                viewHolderMain.insertArrangedSubview(txtpassword, at: 3)
                viewHolderMain.insertArrangedSubview(btnSignIn, at: 4)
                viewHolderMain.insertArrangedSubview(btnSignUp, at: 5)
                view.addSubview(viewHolderMain)
                setupConstraint()
                
            }
            
            
            //Set Manual Constraint
                func setupConstraint(){
                  
                    //add ViewHolder
                    viewHolderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
                    viewHolderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
                    viewHolderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            }

}
