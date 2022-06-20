//
//  FirebaseService.swift
//  TestWork
//
//  Created by Владимир Повальский on 17.06.2022.
//

import Foundation
import FirebaseAuth

final class FirebaseService {
    static let shared = FirebaseService()
    
    func sendSMS(_ numberPhone: String, completion: @escaping (String?) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(numberPhone, uiDelegate: nil) { result, error in
            guard error == nil else { return }
            guard let result = result else { return }
            
            completion(result)
        }
    }
    
    func verificationToken(_ token: String, _ code: String, completion: @escaping (String?) -> Void) {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: token,
            verificationCode: code
        )
        
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            guard let result = result else { return }
            completion(result.description)
        }
    }
    
}
