//
//  TableHeaderUIView.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

class TableHeaderUIView: UIView {

   private let TableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "newbanner")
        return imageView
    }()
    
    private let Label: UILabel = {
         let Label = UILabel()
         Label.text = "Tasty Foods"
         Label.textAlignment = .center
         Label.textColor = .yellow
         Label.shadowColor = UIColor.black
         Label.shadowOffset = CGSize(width: 2, height: 2)
         Label.font = UIFont(name: "Hoefler", size: CGFloat(36))
         
         Label.font = .systemFont(ofSize: 36, weight: .bold)
         Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
     }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(TableImageView)
        TableImageView.addSubview(Label)
        Label.centerXAnchor.constraint(equalTo: TableImageView.centerXAnchor).isActive = true
        Label.centerYAnchor.constraint(equalTo: TableImageView.centerYAnchor, constant: -120).isActive = true
        //Label.leftAnchor.constraint(equalTo: TableImageView.leftAnchor).isActive = true
//        addGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        TableImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
