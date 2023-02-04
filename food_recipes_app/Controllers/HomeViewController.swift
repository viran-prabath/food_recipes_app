//
//  HomeViewController.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

enum Sections: Int {
    case ChineseFoods = 0
    case IndianFoods = 1
    case ItalianFoods = 2
    case JapaneseFoods = 3
    case ThaiFoods = 4
    case AmericanFoods = 5
}


class HomeViewController: UIViewController {

let SectionTitleNames: [String] = ["Chinese Foods", "Indian Foods", "Italian Foods", "Japanese Food", "Thai Foods", "American Foods"]
    
    private let HomeDataTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.Identifier)
        return table
    }()
    
    let bannerView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let MainBanner : UIImageView = {
        let image = UIImageView(image: UIImage(named: "banner"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let ContentView : UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.layer.backgroundColor = UIColor.systemBackground.cgColor
        content.layer.cornerRadius = 30
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(HomeDataTable)
        
        HomeDataTable.delegate = self
        HomeDataTable.dataSource = self
        configureNavBar()
        
        
        let headerView = TableHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        HomeDataTable.tableHeaderView = headerView
    }
    
    private func configureNavBar(){
        var image = UIImage(named: "icon2")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HomeDataTable.frame = view.bounds
    }
    


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionTitleNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.Identifier, for: indexPath) as? CollectionViewTableViewCell else {
                   return UITableViewCell()
               }
        
        switch indexPath.section {
            
        case Sections.ChineseFoods.rawValue:
            
            API.shared.getChineseFoodData { result in
                switch result {
                case.success(let foodcuisine):
                    cell.configure(with: foodcuisine)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.IndianFoods.rawValue:
            
            API.shared.getIndianFoodData { result in
                switch result {
                case.success(let foodcuisine):
                    cell.configure(with: foodcuisine)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        case Sections.ItalianFoods.rawValue:
            
            API.shared.getItalianFoodData { result in
                switch result {
                case.success(let foodcuisine):
                    cell.configure(with: foodcuisine)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.JapaneseFoods.rawValue:
            
            API.shared.getJapaneseFoodData { result in
                switch result {
                case.success(let foodcuisine):
                    cell.configure(with: foodcuisine)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.ThaiFoods.rawValue:
            
            API.shared.getThaiFoodData { result in
                switch result {
                case.success(let foodcuisine):
                    cell.configure(with: foodcuisine)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.AmericanFoods.rawValue:
            
            API.shared.getAmericanFoodData { result in
                switch result {
                case.success(let foodcuisine):
                    cell.configure(with: foodcuisine)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionTitleNames[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
