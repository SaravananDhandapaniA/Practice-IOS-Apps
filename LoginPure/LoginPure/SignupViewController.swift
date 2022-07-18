//
//  SignupViewController.swift
//  LoginPure
//
//  Created by Tringapps on 24/03/22.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet var imageView : UIImageView!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confrimPassword: UITextField!
    
    @IBOutlet weak var emailErr: UILabel!
    @IBOutlet weak var phoneErr: UILabel!
    @IBOutlet weak var passwordErr: UILabel!
    @IBOutlet weak var conPasswordErr: UILabel!
    
    @IBOutlet weak var registerButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        registerButton1.isEnabled = false
        
    }
    
    func resetForm(){
        registerButton1.isEnabled = false
        emailErr.isHidden = false
        phoneErr.isHidden = false
        passwordErr.isHidden = false
        conPasswordErr.isHidden = false
        
        emailErr.text = "Required"
        phoneErr.text = "Required"
        passwordErr.text = "Required"
        conPasswordErr.text = "Required"
        
        firstName.text = ""
        lastName.text = ""
        age.text = ""
        email.text = ""
        phone.text = ""
        password.text = ""
        confrimPassword.text = ""
    }
    
    /*---------       Email Validation          ------------------------*/
    
    @IBAction func emailChanged(_ sender: Any) {
        
        if let emailCheck = email.text
        {
            if let errorMessage = invalideEmail(emailCheck)
            {
                emailErr.text = errorMessage
                emailErr.isHidden = false
            }
            else{
                emailErr.isHidden = true
            }
        }
        checkValidForm()
    }
    
    func invalideEmail(_ value:String) -> String?
    {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    /*--------------------------------------------------------------------*/
    
    /*------------   Phone Number Validation       ----------------------*/
    
    @IBAction func phoneChange(_ sender: Any) {
        if let phoneNumberCheck = phone.text
        {
            if let errorMessage = invalidePhoneNumber(phoneNumberCheck)
            {
                phoneErr.text = errorMessage
                phoneErr.isHidden = false
            }
            else{
                phoneErr.isHidden = true
            }
        }
        checkValidForm()
    }
    func invalidePhoneNumber(_ value:String) -> String?
    {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Phone Number Must Contains Only Digits"
        }
        
        if value.count != 10
        {
            return "Phone Number Must be 10 Digits"
        }
        return nil
    }
    /*--------------------------------------------------------------------*/
    
    /*-------------   Password Validation         -------------------------*/
    @IBAction func passwordChanged(_ sender: Any) {
        if let passwordCheck = password.text
        {
            if let errorMessage = invalidePassword(passwordCheck)
            {
                passwordErr.text = errorMessage
                passwordErr.isHidden = false
            }
            else{
                passwordErr.isHidden = true
            }
        }
        checkValidForm()
    }
    
    func invalidePassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    func containsDigit(_ value: String) -> Bool
    {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    func containsLowerCase(_ value: String) -> Bool
        {
            let reqularExpression = ".*[a-z]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
        
        func containsUpperCase(_ value: String) -> Bool
        {
            let reqularExpression = ".*[A-Z]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
    /*----------------------------------------------------------------------*/
    
    /*-------------     Confrim Password Validation        -------------------*/
    @IBAction func confrimPasswordChanged(_ sender: Any) {
        if let conPasswordCheck = confrimPassword.text
        {
            if let errorMessage = invalideConfrimPassword(conPasswordCheck)
            {
                conPasswordErr.text = errorMessage
                conPasswordErr.isHidden = false
            }
            else{
                conPasswordErr.isHidden = true
            }
        }
        checkValidForm()

    }
        func invalideConfrimPassword(_ value:String) -> String?
        {
            if password.text != confrimPassword.text
            {
                return "Password not match"
            }
            return nil
        }
    /*-------------------------------------------------------------------------*/
    func checkValidForm()
    {
        if emailErr.isHidden && passwordErr.isHidden && phoneErr.isHidden
        {
            registerButton1.isEnabled = true
        }
        else{
            registerButton1.isEnabled = false
        }
    }
    
    
    @IBAction func didTaButton(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        
        
        UserDefaults.standard.set(firstName.text, forKey: "FirstName")
        UserDefaults.standard.set(lastName.text, forKey: "LastName")
        UserDefaults.standard.set(age.text, forKey: "Age")
        UserDefaults.standard.set(email.text, forKey: "Email")
        UserDefaults.standard.set(phone.text, forKey: "Phone")
        UserDefaults.standard.set(password.text, forKey: "Password")
        UserDefaults.standard.set(confrimPassword.text, forKey: "ConfrimPassword")
        

        resetForm()
        
        print("Button worked")
    }
    

    @IBAction func cancelButton(_ sender: Any) {
       
    }
    
}






extension SignupViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
