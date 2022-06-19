//
//  CodeViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 15.06.2022.
//

import UIKit

class CodeViewController: UIViewController {

    
    private var cartView: UIView = {
        var uiview = UIView()
        uiview.backgroundColor = .white
        uiview.layer.cornerRadius = 25
        uiview.layer.masksToBounds = false
        uiview.layer.shadowOpacity = 0.5
        uiview.layer.shadowColor = UIColor.gray.cgColor
        uiview.layer.shadowRadius = 10
        uiview.layer.shadowOffset = .zero
        uiview.translatesAutoresizingMaskIntoConstraints = false
        return uiview
    }()
    
    private var textFieldForCode: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Код из смс"
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var buttonNext: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewWillLayoutSubviews() {
        constraintsView()
    }
    
    private func constraintsView() {
        NSLayoutConstraint.activate([
            cartView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cartView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            cartView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            cartView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            cartView.heightAnchor.constraint(equalToConstant: 180),
            textFieldForCode.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 20),
            textFieldForCode.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 30),
            textFieldForCode.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -30),
            textFieldForCode.heightAnchor.constraint(equalToConstant: 50),
            buttonNext.topAnchor.constraint(equalTo: textFieldForCode.bottomAnchor, constant: 20),
            buttonNext.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 30),
            buttonNext.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -30),
            buttonNext.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(cartView)
        cartView.addSubview(textFieldForCode)
        cartView.addSubview(buttonNext)
        
    }
    

    

}
