//
//  ViewController.swift
//  CoreTodoList
//
//  Created by Tringapps on 01/04/22.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    
    @IBOutlet var tabRef: UITableView!
    
    let networking = NetworkingService.shared
    let persistance = PersistanceService.shared
    
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabRef.rowHeight = 150
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("PersistedDataUpdated"), object: nil, queue: .main) { (_) in

        }
        
        persistance.fetch(Player.self) { [weak self](players) in
            self?.players = players
            print(players.count)
            self?.tableView.reloadData()
            if players == []{
                self?.getPlayers()
            }
            
            }
        
       
         getPlayers()
        deleteAllData()
        }
        
    
      
    

    func getPlayers(){
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        if let url = url {
            let data = try? Data(contentsOf: url)
            do{
                guard let data = data
                else{return}
                
                guard let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else{return}
                
                print(jsonArray)
                
                let players:[Player] = jsonArray.compactMap {
                    guard
                        
                        let name = $0["name"] as? String,
                        let country = $0["country"] as? String,
                        let role = $0["role"] as? String,
                        let id = $0["id"] as? Int16
                    else{ return nil }
                    
                    let player = Player(context: persistance.context)
                    player.name = name
                    player.country = country
                    player.role = role
                    player.id = id
                    
                    return player
                }
                self.players = players
            DispatchQueue.main.async {
                self.persistance.save()
                }
                
            }
            catch{
                print(error)
            }
        }
    }
    
    func deleteAllData(){
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let deleteAllReq = NSBatchDeleteRequest(fetchRequest: fetchReq)
        
        do{
            try persistance.context.execute(deleteAllReq)
        }catch let error{
            print(error)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabRef.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! tCell
        let player = players[indexPath.row]
        cell.nameLabel.text = player.name
        cell.countryLabel.text = player.country
        cell.roleLabel.text = player.role
        cell.imgView.image = UIImage(named: player.name)
        
//        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
//        fetchRequest.predicate = NSPredicate.init(format: "country == 'India'")
//        let objects = try! persistance.context.fetch(fetchRequest)
//        for obj in objects {
//            persistance.context.delete(obj)
//
//        }
//        do {
//            try persistance.context.save()
//        }catch{
//            fatalError("Error")
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "") { _,_,_ in
            self.persistance.context.delete(self.players[indexPath.row])
            self.persistance.save()
            self.persistance.fetch(Player.self){ [weak self](players)  in
                self?.players = players
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
}

