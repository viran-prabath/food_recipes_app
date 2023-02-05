//
//  SearchFoodResultsViewController.swift
//  food_recipes_app
//
//  Created by MacOs12 on 2023-02-05.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

protocol SearchFoodResultsViewControllerDelegate: AnyObject {
    func searchFoodResultsViewControllerDidTapItem(_ viewModel: FoodsDetailsViewModels)
}

class SearchFoodResultsViewController: UIViewController {
    
    public var foodData: [FoodsDataModels] = [FoodsDataModels]()
    
    public weak var delegate: SearchFoodResultsViewControllerDelegate?
    
    public let searchFoodResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FoodTitleCollectionViewCell.self, forCellWithReuseIdentifier: FoodTitleCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(searchFoodResultsCollectionView)
        
        searchFoodResultsCollectionView.delegate = self
        searchFoodResultsCollectionView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchFoodResultsCollectionView.frame = view.bounds
    }

}


extension SearchFoodResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
        //return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTitleCollectionViewCell.identifier, for: indexPath) as? FoodTitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let food = foodData[indexPath.row]
        cell.configure(with: food.imageUrl ?? "" )
        //cell.backgroundColor = .blue
        return cell
    }
    

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//
//        let food = foodData[indexPath.row]
//        let foodId = food.foodId ?? ""
//        APIConnection.shared.getSelectedFood(with: foodId) { [weak self] result in
//            switch result {
//            case .success():
//                self?.delegate?.searchFoodResultsViewControllerDidTapItem(FoodViewModel(foodName: food.foodId ?? "", imageURL: food.imageUrl ?? ""))
//
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let food = foodData[indexPath.row]
        let foodID = food.foodId ?? ""
        API.shared.getSelectedFood(with: foodID) { [weak self] result in
            switch result {
            case .success(let foods):
                //self?.delegate?.searchFoodResultsViewControllerDidTapItem(FoodDetailsViewModel(foodId: foodID, foodName: food.name ?? "", imageURL: food.imageUrl ?? ""))
                self?.delegate?.searchFoodResultsViewControllerDidTapItem(FoodsDetailsViewModels(foodId: foodID, name: food.name ?? "", imageUrl: food.imageUrl ?? "", cuisine: food.cuisine ?? "", description: food.description ?? "", calories: food.calories ?? "", carbohydrates: food.carbohydrates ?? "", fat: food.fat ?? "", protein: food.protein ?? "", sugar: food.sugar ?? "", ingredient: food.ingredient ?? ""))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        

    }
    
}

