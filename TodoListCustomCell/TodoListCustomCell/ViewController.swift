//
//  ViewController.swift
//  TodoListCustomCell
//
//  Created by Tringapps on 29/03/22.
//
//  ViewController.swift
//  TodoList
//
//  Created by Tringapps on 28/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var result: Result?
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJSON()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return result?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.data[section].title
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.data[section].items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = result?.data[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = text
        return cell
    }
    
    
    
    func parseJSON()
    {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json")
        else{
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            let jsonData = try Data(contentsOf: url)
            print("jsondata:\(jsonData)")
            result = try JSONDecoder().decode(Result.self, from: jsonData)
        }
        catch{
            print("Error: \(error)")
        }
    }
}


