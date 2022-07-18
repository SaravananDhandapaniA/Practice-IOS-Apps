//
//  ViewController.swift
//  CustomTodo
//
//  Created by Tringapps on 29/03/22.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   

    @IBOutlet weak var tableView: UITableView!

    var cricketNameArray = [String]()
    var cricketCountryArray = [String]()
    var cricketRoleArray = [String]()
    var footballNameArray = [String]()
    var footballCountryArray = [String]()
    var footballRoleArray = [String]()
    var crickCount = Int()
    var footCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        parse()
        tableView.rowHeight = 150
    }

    func parse()
    {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        if let url = url
        {
            let data = try? Data(contentsOf: url)
            do{
                guard let data = data
                else{return}
                
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
                let cricketArray = json?.value(forKey: "Cricket") as! NSArray
                let footballArray = json?.value(forKey: "Football") as! NSArray
                crickCount = cricketArray.count
                footCount = footballArray.count
                
                for arrayData in cricketArray
                {
                    let cricket = arrayData as! [String:Any]

                    guard let name = cricket["name"]
                    else{return}
                    cricketNameArray.append(name as! String)
                    
                    guard let country = cricket["country"]
                    else{return}
                    cricketCountryArray.append(country as! String)
                    
                    guard let role = cricket["role"]
                    else{return}
                    cricketRoleArray.append(role as! String)
                    
                }
                
                for arrayData1 in footballArray
                {
                    let football = arrayData1 as! [String:Any]
                    
                    guard let name = football["name"]
                    else{return}
                    footballNameArray.append(name as! String)
                    
                    guard let country = football["country"]
                    else{return}
                    footballCountryArray.append(country as! String)
                    
                    guard let role = football["role"]
                    else{return}
                    footballRoleArray.append(role as! String)
                    
                }
                
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = ""
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return crickCount
        }
        return footCount
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id",for: indexPath) as! tCell
        
        let name = indexPath.section == 0 ? cricketNameArray[indexPath.row] : footballNameArray[indexPath.row]
        let country = indexPath.section == 0 ? cricketCountryArray[indexPath.row] : footballCountryArray[indexPath.row]
        let role = indexPath.section == 0 ? cricketRoleArray[indexPath.row] : footballRoleArray[indexPath.row]
        cell.nameLabel.text = name
        cell.img.image = UIImage(named: name)
        cell.countryLabel.text = country
        cell.roleLabel.text = role
        return cell
    }
    
}

