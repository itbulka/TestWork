//
//  CodeViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 15.06.2022.
//

import UIKit

class CodeViewController: UIViewController {
    
    private var presenter: CodeViewPresenterProtocol?
    
    var identifierToken: String?
    var numberPhone: String?
    
        //MARK: Объекты UI
    
    
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
        textField.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var repeatSendSMS: UIButton = {
       let button = UIButton()
        button.setTitle("Отправить еще раз", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    
    
        //MARK: Life Cycle View Conrtoller
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cartView)
        self.navigationItem.hidesBackButton = false
        
        cartView.addSubview(textFieldForCode)
        cartView.addSubview(repeatSendSMS)
        cartView.addSubview(buttonNext)
        
        textFieldForCode.delegate = self
        presenter = CodeViewPresenter(self)
        
        buttonNext.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        repeatSendSMS.addTarget(self, action: #selector(repeatSMS), for: .touchUpInside)
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
            cartView.heightAnchor.constraint(equalToConstant: 220),
            textFieldForCode.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 20),
            textFieldForCode.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 60),
            textFieldForCode.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -60),
            textFieldForCode.heightAnchor.constraint(equalToConstant: 50),
            buttonNext.topAnchor.constraint(equalTo: textFieldForCode.bottomAnchor, constant: 20),
            buttonNext.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 30),
            buttonNext.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -30),
            buttonNext.heightAnchor.constraint(equalToConstant: 50),
            repeatSendSMS.topAnchor.constraint(equalTo: buttonNext.bottomAnchor, constant: 10),
            repeatSendSMS.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -30),
            repeatSendSMS.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 30),
            repeatSendSMS.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
        
    
        //MARK: Methods for worked
    
    
    func setTitleButton(_ text: String) {
        repeatSendSMS.setTitle(text, for: .normal)
    }
    
    func isEnabledButtonSMS(_ isEnabled: Bool) {
        repeatSendSMS.isEnabled = isEnabled
    }
    
    func getCodeUser() -> String? {
        return textFieldForCode.text
    }
    
    @objc func nextScreen() {
        presenter?.clickButtonNext()
    }
    
    @objc func repeatSMS() {
        presenter?.clickButtonRepeat()
    }
    
        //MARK: Работа с таймером
    @objc func timerForRepeat() {
        presenter?.updatetextButton()

    }
}

extension CodeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        if newString.count <= 6 {
            textField.text = newString
        }
        return false
    }
    
}
