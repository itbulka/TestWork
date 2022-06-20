//
//  AuthViewPresenter.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation
import FirebaseAuth

protocol AuthViewPresenterProtocol {
    func format(with mask: String, phone: String) -> String
    func sendMessageCode(_ number: String?)
}

class AuthViewPresenter: AuthViewPresenterProtocol {
    
    weak var authViewContrtoller: AuthViewController?
    
    init(_ authViewController: AuthViewController? = nil) {
        self.authViewContrtoller = authViewController
    }
    
    func sendMessageCode(_ number: String?) {
        guard var number = number else { return }
        number = format(with: "+XXXXXXXXXXX", phone: number)
        
        FirebaseService.shared.sendSMS(number) { [weak self] result in
            guard let self = self else { return }
            guard let result = result else { return }
            
            for (numberKey, code) in CollectionNumber().collectionNumberAndCode {
                if numberKey == number {
                    print(code)
                }
            }
            let codeViewConrtoller = CodeViewController()
            codeViewConrtoller.identifierToken = result
            codeViewConrtoller.numberPhone = number
            self.authViewContrtoller?.navigationController?.pushViewController(codeViewConrtoller, animated: true)
        }
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex

        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                
                index = numbers.index(after: index)

            } else {
                result.append(ch) 
            }
        }
        return result
    }
    
    
}

struct CollectionNumber {
    var collectionNumberAndCode: [String: Int] = [
        "+10000000000" : 324542,
        "+10000000001": 888777,
        "+71111111111": 777555
    ]
}
