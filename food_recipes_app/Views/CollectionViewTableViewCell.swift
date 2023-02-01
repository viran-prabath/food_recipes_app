//
//  CollectionViewTableViewCell.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let Identifier = "CollectionViewTableCell"
    
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
}
