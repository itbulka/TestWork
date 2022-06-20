//
//  MenuPlaceViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 19.06.2022.
//

import UIKit

class MenuPlaceViewController: UIViewController {
    
    var menuList: [Dish]?
    
    private let tablieView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: ProductViewCell.identifier)
        return tableView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        print("Menu auth")
    }

    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tablieView)
        
        tablieView.delegate = self
        tablieView.dataSource = self
        
    }
    
    override func viewWillLayoutSubviews() {
        tablieView.frame = view.bounds
    }
    

}

extension MenuPlaceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = menuList?.count else { return 0}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductViewCell.identifier, for: indexPath) as? ProductViewCell else { return UITableViewCell() }
        
        guard let menu = menuList else { return UITableViewCell() }
        
        cell.loadUI(menu[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
