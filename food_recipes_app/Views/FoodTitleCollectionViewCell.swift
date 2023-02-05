//
//  FoodTitleCollectionViewCell.swift
//  food_recipes_app
//
//  Created by VPJ Production on 2/1/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit
import SDWebImage

class FoodTitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FoodTitleCollectionViewCell"
    
    private let foodImagePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(foodImagePoster)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImagePoster.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: model) else {return}
        foodImagePoster.sd_setImage(with: url, completed: nil)
    }
}
