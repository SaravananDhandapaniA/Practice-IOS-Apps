//
//  ViewController.swift
//  MVVM-Sample
//
//  Created by Tringapps on 19/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calulateButtonTapped(_ sender: Any) {
        
        guard let name = nameField.text, name != "" else {
                    print("Enter the name")
                    return
                }
                
                guard let date = dateField.text, date != "" else {
                    print("Enter the date")
                    return
                }
                
                guard let month = monthField.text, month != "" else {
                    print("Enter the month")
                    return
                }
                
                guard let year = yearField.text, year != "" else {
                    print("Enter the year")
                    return
                }
        
        let person = EditViewModel(name: name, date: Int(date)!, month: Int(month)!, year: Int(year)!)
        
        print(person.name)
        print(person.age)
        
        createAlert(name: person.name, age: person.age)
    }
    
    func createAlert(name: String , age: String){
     
        let alert = UIAlertController(title: name, message: age, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.nameField.text = ""
            self.dateField.text = ""
            self.monthField.text = ""
            self.yearField.text = ""
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

