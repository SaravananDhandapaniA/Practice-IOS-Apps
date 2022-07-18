//
//  ViewController.swift
//  CoreMovie
//
//  Created by Tringapps on 04/04/22.
//

import UIKit

class ViewController: UIViewController {

    private var services = Services()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    //   loadPopularMovieData()
       
    }

    private func loadPopularMovieData(){

        services.getPopularMoviesData { [weak self](result) in
            
            switch result{
            case .success(let listOf):
                CoreData.sharedIntance.saveDataOf(movies: listOf.movies)
                self?.perform(#selector(self?.mainScreen))
            case .failure(let error):
                self?.showAlertWith(title: "Could Not Connect!", message: "Please check your internet connection \n or try again later")
                    print("Error processing json data: \(error)")
            }
        }
}
    
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
           let action = UIAlertAction(title: "OK", style: .default) { (action) in
               self.dismiss(animated: true, completion: nil)
           }
           alertController.addAction(action)
           self.present(alertController, animated: true, completion: nil)
       }
    
    @objc func mainScreen() {
           performSegue(withIdentifier: "moviesList", sender: self)
       }

}
