//
//  ViewController.swift
//  tableViewPractice
//
//  Created by Tringapps on 28/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let names = [
    "Saravanan","Kishore","Praveen","Vinith","Maha",
    "Bala","Vignesh","PB","Harsh","Pambali"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
}
