//
//  SignupViewModel.swift
//  LoginSignup
//
//  Created by Tringapps on 15/03/22.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPw = ""
    @Published var phoneNum = ""
    @Published var firstname = ""
    @Published var lastname = ""
    
    func passwordsMatch() -> Bool {
        password == confirmPw
    }
    
    func isPasswordValid() -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
       
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    func isPhoneValid(phone: String) -> Bool {
                let phoneRegex = "^[0-9]{0,1}+[0-9]{9}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
                return phoneTest.evaluate(with: phoneNum)
            }
    
    var isSignUpComplete: Bool {
        if !passwordsMatch() ||
        !isPasswordValid() ||
        !isEmailValid() ||
        !isPhoneValid(phone: phoneNum)
        {
            return false
        }
        return true
    }




    var confirmPwPrompt: String {
        if passwordsMatch() {
            return ""
        } else {
            return "Password fields do not match"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
        }
    }
    
    var phonePrompt : String {
        if isPhoneValid(phone: phoneNum){
            return ""
        }else{
            return "Phone Number must be 10 digits"
        }
    }
    
    func signUp() {
        email = ""
        password = ""
        confirmPw = ""
        phoneNum = ""
        firstname = ""
        lastname = ""
    }
}
