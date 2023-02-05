//
//  SignUpViewController.swift
//  food_recipes_app
//
//  Created by MacOs12 on 2023-02-03.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    
    let txtfname : UITextField = {
       let txtfname = UITextField()
        txtfname.translatesAutoresizingMaskIntoConstraints = false
        txtfname.borderStyle = .roundedRect
        txtfname.placeholder = "First Name"
        txtfname.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtfname.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtfname.layer.cornerRadius = 10
        txtfname.layer.borderWidth = 1
        txtfname.layer.borderColor = UIColor.black.cgColor
        return txtfname
    }()
    
    let txtlname : UITextField = {
       let txtlname = UITextField()
        txtlname.translatesAutoresizingMaskIntoConstraints = false
        txtlname.borderStyle = .roundedRect
        txtlname.placeholder = "Last Name"
        txtlname.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtlname.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtlname.layer.cornerRadius = 10
        txtlname.layer.borderWidth = 1
        txtlname.layer.borderColor = UIColor.black.cgColor
        return txtlname
    }()
    
    let txtemail : UITextField = {
       let txtemail = UITextField()
        txtemail.translatesAutoresizingMaskIntoConstraints = false
        txtemail.borderStyle = .roundedRect
        txtemail.placeholder = "Email"
        txtemail.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtemail.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtemail.layer.cornerRadius = 10
        txtemail.layer.borderWidth = 1
        txtemail.layer.borderColor = UIColor.black.cgColor
        return txtemail
    }()
    
    let txtpassword : UITextField = {
       let txtpassword = UITextField()
        txtpassword.translatesAutoresizingMaskIntoConstraints = false
        txtpassword.borderStyle = .roundedRect
        txtpassword.placeholder = "Password"
        txtpassword.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtpassword.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txtpassword.layer.cornerRadius = 10
        txtpassword.layer.borderWidth = 1
        txtpassword.layer.borderColor = UIColor.black.cgColor
        txtpassword.isSecureTextEntry = true
        return txtpassword
    }()
    
    let signUpButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn.layer.cornerRadius = 20
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
        btn.backgroundColor = UIColor.blue
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        return btn
    }()
    
    let loginButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btn.layer.cornerRadius = 20
        btn.setTitle("Sign In", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
        btn.backgroundColor = UIColor.gray
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        return btn
    }()
       
    let TOPContainer : UIView = {
        let UI = UIView()
        UI.translatesAutoresizingMaskIntoConstraints = false
        return UI
    }()
    
    let viewHolderMain : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
      
       override func viewDidLoad() {
           super.viewDidLoad()
           self.view.backgroundColor = .systemBackground
           _ = UserDefaults.standard.string(forKey: "userID")
           self.view.backgroundColor = .white
           //assignbackground()
           let apperence = UINavigationBarAppearance()
           apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
           navigationItem.standardAppearance = apperence
           self.navigationController?.navigationBar.prefersLargeTitles = true
           titleLabel.text = "Registration"
           view.addSubview(TOPContainer)
           TOPContainer.addSubview(viewHolderMain)
           viewHolderMain.insertArrangedSubview(titleLabel, at: 0)
           viewHolderMain.insertArrangedSubview(txtfname, at: 1)
           viewHolderMain.insertArrangedSubview(txtlname, at: 2)
           viewHolderMain.insertArrangedSubview(txtemail, at: 3)
           viewHolderMain.insertArrangedSubview(txtpassword, at: 4)
           viewHolderMain.insertArrangedSubview(signUpButton, at: 5)
           viewHolderMain.insertArrangedSubview(loginButton, at: 6)
           view.addSubview(viewHolderMain)
           setupConstraint()
           signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
           loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
       }
    
    func setupConstraint(){
      
        TOPContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        TOPContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        TOPContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        TOPContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      
        //add ViewHolder
        viewHolderMain.centerXAnchor.constraint(equalTo: TOPContainer.centerXAnchor).isActive = true
        viewHolderMain.centerYAnchor.constraint(equalTo: TOPContainer.centerYAnchor).isActive = true
        
}
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
       let fname = txtfname.text!
       let lname = txtlname.text!
       let email = txtemail.text!
        let password = txtpassword.text!.lowercased()
        
        if(fname.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter first name", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if(lname.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter last name", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if(email.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter email", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else if(password.isEmpty == true)
        {
            let alert = UIAlertController(title: "Warning", message: "Please enter password", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            API.signUp(fname: fname, lname:lname, email: email, password: password) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        let homeTabBarViewController = HomeTabBarViewController()
                        UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                            UIApplication.shared.windows.first?.rootViewController = homeTabBarViewController
                        }, completion: nil)
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
        
    }
    
       
       @objc func loginButtonTapped() {
           let loginViewController = SignInViewController()
           UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                 UIApplication.shared.windows.first?.rootViewController = loginViewController
             }, completion: nil)
       }
    


}
