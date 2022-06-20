//
//  EstablishmentsViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 15.06.2022.
//

import UIKit

class PlacesViewController: UIViewController {
    
    private var presenter: PlacesViewPresenterProtocol!

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 4) - 8, height: (UIScreen.main.bounds.width / 4) - 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Заведения"
        
        presenter = PlacesViewPresenter(self)
        presenter.getPlaces()
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


    func reloadData() {
        collectionView.reloadData()
    }

}

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(presenter.places[indexPath.row].image)
        return cell
    }
    
}

