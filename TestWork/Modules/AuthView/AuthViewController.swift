//
//  ViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 15.06.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
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
    
    private var textFieldForNumber: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Номер телефона"
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var buttonSendCode: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 12
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cartView)
        cartView.addSubview(textFieldForNumber)
        cartView.addSubview(buttonSendCode)
        
        buttonSendCode.addTarget(self, action: #selector(tapBtn), for: .allEvents)
    }
    
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
            textFieldForNumber.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 20),
            textFieldForNumber.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 30),
            textFieldForNumber.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -30),
            textFieldForNumber.heightAnchor.constraint(equalToConstant: 50),
            buttonSendCode.topAnchor.constraint(equalTo: textFieldForNumber.bottomAnchor, constant: 20),
            buttonSendCode.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 30),
            buttonSendCode.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -30),
            buttonSendCode.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func tapBtn() {
        self.navigationController?.pushViewController(CodeViewController(), animated: true)
    }


}

