//
//  FirstViewController.swift
//  ExampleViewTransition
//
//  Created by Tringapps on 21/04/22.
//

import UIKit
 
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var names: [String] = ["Mumbai","New York","Tokyo","London","Beijing","Sydney","Wellington","Madrid","Rome","Cape Town","Ottawa"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
     
       // Apply radius to Popupview
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
 
    }
    
    
    // Returns count of items in tableView
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count;
    }
    
    
    // Select item from tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Company Name : " + names[indexPath.row])
      
         Shared.shared.companyName = names[indexPath.row]
 
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        print("storyBoard : \(storyBoard)")
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        print("newview:\(newViewController)")
        //dismiss(animated: true, completion: nil)
       self.present(newViewController, animated: true, completion: nil)
        
    }
    
    //Assign values for tableView
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
 
        cell.textLabel?.text = names[indexPath.row]
  
        return cell
    }
    
    // Close PopUp
    @IBAction func closePopup(_ sender: Any) {
        
   dismiss(animated: true, completion: nil)
    }
    
}
