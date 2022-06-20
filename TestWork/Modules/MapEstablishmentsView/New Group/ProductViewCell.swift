//
//  ProductViewCell.swift
//  TestWork
//
//  Created by Владимир Повальский on 19.06.2022.
//

import UIKit
import SwiftUI

class ProductViewCell: UITableViewCell {
    
    static let identifier: String = "ProductViewCell"
    
    private let imageProduct: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1990"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageProduct)
        contentView.addSubview(priceLabel)
        contentView.addSubview(titleLabel)
        
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            imageProduct.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            imageProduct.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14),
            imageProduct.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            imageProduct.widthAnchor.constraint(equalToConstant: 70),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            titleLabel.leftAnchor.constraint(equalTo: imageProduct.rightAnchor, constant: 14),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.leftAnchor.constraint(equalTo: imageProduct.rightAnchor, constant: 14),
            priceLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func loadUI(_ dish: Dish) {
        imageProduct.sd_setImage(with: URL(string: dish.image))
        titleLabel.text = dish.name
        priceLabel.text = "Цена: \(dish.price)"
    }


}
