//
//  CodeViewPresenter.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation
import FirebaseAuth

protocol CodeViewPresenterProtocol {
    func updatetextButton()
    func clickButtonNext()
    func clickButtonRepeat()
}

class CodeViewPresenter: CodeViewPresenterProtocol {
    
    weak var codeViewConrtoller: CodeViewController?
    
    lazy var timer = Timer()
    var seconds: Int = 120
    
    init(_ codeViewConrtoller: CodeViewController? = nil) {
        self.codeViewConrtoller = codeViewConrtoller
    }

    
    func checkUser(_ number: String, _ identifierId: String, completion: @escaping (Bool) -> Void) {
        let parameters: NetworkManager.Parameters = [
            "phone": number,
            "id": identifierId
        ]
        
        NetworkManager.shared.request(parameters: parameters, method: "POST", endpoint: "checkUser") { result in
            switch result {
            case .success(let data):
                guard data != nil else { return }
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
        
    }
    
    func updatetextButton() {
        seconds -= 1
        
        if seconds > 60 {
            codeViewConrtoller?.setTitleButton("1:\(seconds - 61)")
        } else {
            codeViewConrtoller?.setTitleButton("\(seconds - 1)")
        }
        if seconds == 0 {
            codeViewConrtoller?.setTitleButton("Отправить еще раз")
            codeViewConrtoller?.isEnabledButtonSMS(true)
            seconds = 120
            timer.invalidate()
        }
    }
    
    func clickButtonNext() {
        guard let code = codeViewConrtoller?.getCodeUser() else { return }
        guard let token = codeViewConrtoller?.identifierToken else { return }
        guard let numberPhone = codeViewConrtoller?.numberPhone else { return }
        
        if timer.isValid {
            timer.invalidate()
        }
        
        FirebaseService.shared.verificationToken(token, code) { [weak self] result in
            guard let self = self else { return }
            guard result != nil else { return }
            
            self.checkUser(numberPhone, token) { isUser in
                if isUser {
                    DispatchQueue.main.async {
                        self.codeViewConrtoller?.navigationController?.pushViewController(TabViewController(), animated: true)
                    }
                }
            }
        }
    }
    
    func clickButtonRepeat() {
        print("click repeat")
        guard let numberPhone = codeViewConrtoller?.numberPhone else { return }
        codeViewConrtoller?.isEnabledButtonSMS(false)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: codeViewConrtoller, selector: #selector(codeViewConrtoller?.timerForRepeat), userInfo: nil, repeats: true)
        
        FirebaseService.shared.sendSMS(numberPhone) { result in
            guard let _ = result else { return }
            
            for (numberKey, code) in CollectionNumber().collectionNumberAndCode {
                if numberKey == numberPhone {
                    print(code)
                    return
                }
            }
        }
    }
    
    
}
