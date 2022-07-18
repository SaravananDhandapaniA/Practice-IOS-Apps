//
//  MoviesListTableViewCell.swift
//  CoreMovie
//
//  Created by Tringapps on 04/04/22.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    

    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieOverview: UILabel!
    

    @IBOutlet weak var movieRate: UILabel!
    
    
  
    @IBOutlet weak var movieBackdrop: UIImageView!
    
    private var service = Services()
        private var urlString: String = ""
        
     
        func setCellWithValuesOf(_ movie:MovieEntity) {
            updateUI(title: movie.title, rate: movie.rate, overview: movie.overview, backdrop: movie.backdropImage)
        }
        
      
        private func updateUI(title:String?, rate:String?, overview:String?, backdrop:String?) {
            
            self.movieTitle.text = title
            self.movieRate.text = rate
            self.movieOverview.text = overview
            
            guard let backdropString = backdrop else {return}
            urlString = "https://image.tmdb.org/t/p/w300" + backdropString
            
            guard let backdropImageURL = URL(string: urlString) else {
                self.movieBackdrop.image = UIImage(named: "noImageAvailable")
                return
            }
            
            self.movieBackdrop.image = nil
            
            service.getImageDataFrom(url: backdropImageURL) { [weak self] (data: Data) in
                if let image = UIImage(data: data) {
                    self?.movieBackdrop.image = image
                } else {
                    self?.movieBackdrop.image = UIImage(named: "noImageAvailable")
                }
            }
            
            viewsAttributes()
        }
        
        private func viewsAttributes() {
            
            // Movie Backdrop attributes
            movieBackdrop.layer.cornerRadius = 20
            movieBackdrop.layer.borderWidth = 0.8
            movieBackdrop.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            movieBackdrop.contentMode = .scaleAspectFill
            
            // Movie Rate attributes
            movieRate.layer.masksToBounds = true
            movieRate.layer.cornerRadius =  15
        }// Configure the view for the selected state
    }


