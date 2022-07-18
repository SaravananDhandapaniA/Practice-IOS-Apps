//
//  MoviesViewViewController.swift
//  CoreMovie
//
//  Created by Tringapps on 04/04/22.
//

import UIKit
import CoreData

class MoviesListViewController: UIViewController, UpdateTableViewDelegate {

 
    @IBOutlet weak var tableView: UITableView!
    
    
    private var viewModel = MoviesListViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        self.tableView.dataSource = self
        self.viewModel.delegate = self
        loadData()
    }
    

    private func loadData() {
            viewModel.retrieveDataFromCoreData()
        }
        
        func reloadData(sender: MoviesListViewModel) {
            self.tableView.reloadData()
        }
        

        private func setNavigationBar() {
            // Transparent the navigation bar
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            // Navigation bar item color (time, battery) - white
            self.navigationController?.navigationBar.barStyle = .black
        }
    }


    extension MoviesListViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfRowsInSection(section: section)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            let object = viewModel.object(indexPath: indexPath)
            
            if let movieCell = cell as? MoviesListTableViewCell {
                if let movie = object {
                    movieCell.setCellWithValuesOf(movie)
                }
            }
            return cell
        }
        
       

}
