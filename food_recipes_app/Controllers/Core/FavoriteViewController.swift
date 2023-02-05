//
//  FavoriteViewController.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    private var foodData: [FoodsDataModels] = [FoodsDataModels]()
       
       @IBOutlet weak var tableView: UITableView!
       
       private let searchDataTable: UITableView = {
           let table = UITableView()
           table.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.identifier)
           return table
       }()
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .systemBackground
           title = "Favorite Foods List"
           navigationController?.navigationBar.prefersLargeTitles = true
           navigationController?.navigationItem.largeTitleDisplayMode = .always
           navigationController?.navigationBar.tintColor = .white
           view.addSubview(searchDataTable)
           searchDataTable.delegate = self
           searchDataTable.dataSource = self
           fetchdata()
       }
       
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           searchDataTable.frame = view.bounds
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           fetchdata()
       }
       
       func fetchdata(){
           let username = UserDefaults.standard.string(forKey: "userID")
                   
           guard let unwrappedString = username else {
               return
           }
           
           if (unwrappedString == nil)
           {
               let signinViewController = SignInViewController()
               UIView.transition(with: UIApplication.shared.windows.first!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                   UIApplication.shared.windows.first?.rootViewController = signinViewController
               }, completion: nil)
           }
           else
           {
               print(unwrappedString)
               fetchSearchData(query: "\(unwrappedString)")
           }
           
           
       }
       
       
   }

   extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return foodData.count;
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as? FoodTableViewCell else {
               return UITableViewCell()
           }
           
           
           let food = foodData[indexPath.row]
           let model = FoodViewModel(foodName: food.name ?? "Unknown name", imageURL: food.imageUrl ?? "")
           cell.config(with: model)
           
           return cell;
       }
       
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 140
       }
       
       
       func fetchSearchData(query: String){
           API.shared.searchFavFoodsByUserId(with: query) { [weak self] result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let foods):
                       DispatchQueue.main.async {
                           self?.foodData = foods
                           self?.searchDataTable.reloadData()
                           print(result)
                       }
                   case .failure(let error):
                       print(error.localizedDescription)
                       //print(error)
                   }
               }
           }
       }
       
   }

