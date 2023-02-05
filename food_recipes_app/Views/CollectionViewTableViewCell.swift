//
//  CollectionViewTableViewCell.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: FoodsDetailsViewModels)
}

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableCell"
    weak var delegate: CollectionViewTableViewCellDelegate?
    private var foodtitle: [FoodsDataModels] = [FoodsDataModels]()
        
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FoodTitleCollectionViewCell.self, forCellWithReuseIdentifier: FoodTitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with foodtitle: [FoodsDataModels]) {
        self.foodtitle = foodtitle
        
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTitleCollectionViewCell.identifier, for: indexPath) as? FoodTitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let model = foodtitle[indexPath.row].imageUrl else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodtitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let food = foodtitle[indexPath.row]
        guard let foodId = food.foodId else {
            return
        }


        API.shared.getSelectedFood(with: foodId ) { [weak self] result in
            switch result {
            case .success( _ ):

                let food = self?.foodtitle[indexPath.row]
                guard (food?.foodId) != nil else {
                    return
                }
                guard let strongSelf = self else {
                    return
                }
                let viewModel = FoodsDetailsViewModels(foodId: food?.foodId ?? "", name: food?.name ?? "", imageUrl: food?.imageUrl ?? "", cuisine: food?.cuisine ?? "", description: food?.description ?? "", calories: food?.calories ?? "", carbohydrates: food?.carbohydrates ?? "", fat: food?.fat ?? "", protein: food?.protein ?? "", sugar: food?.sugar ?? "", ingredient: food?.ingredient ?? "")
                self?.delegate?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
                
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
        
    }
}
