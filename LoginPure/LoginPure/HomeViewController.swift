//
//  HomeViewController.swift
//  LoginPure
//
//  Created by Tringapps on 24/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
   
    @IBOutlet weak var firstNameStored: UILabel!
    @IBOutlet weak var lastNameStored: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstNameStored.text = UserDefaults.standard.string(forKey: "FirstName")
        lastNameStored.text = UserDefaults.standard.string(forKey: "LastName")
        
    }
    
    
    @IBAction func signoutButtonTapped(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "FirstName")
        UserDefaults.standard.removeObject(forKey: "LastName")
        UserDefaults.standard.removeObject(forKey: "Age")
        UserDefaults.standard.removeObject(forKey: "Email")
        UserDefaults.standard.removeObject(forKey: "Phone")
        UserDefaults.standard.removeObject(forKey: "Password")
        UserDefaults.standard.removeObject(forKey: "ConfrimPassword")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
