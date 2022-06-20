//
//  CustomCollectionViewCell.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import UIKit
import SDWebImage

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private var imagePoster: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imagePoster)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOffset = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        imagePoster.frame = contentView.bounds
    }
    
    func configure(_ stringUrl: String) {
        guard let url = URL(string: stringUrl) else { return }
        imagePoster.sd_setImage(with: url)
    }
    
}
