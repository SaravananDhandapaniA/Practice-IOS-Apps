//
//  CoreData.swift
//  CoreMovie
//
//  Created by Tringapps on 04/04/22.
//

import UIKit
import CoreData

class CoreData {
    
    static let sharedIntance = CoreData()
    private init() {}
    
    private let container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    private let fetchRequest = NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    
    func saveDataOf(movies:[Movie])
    {
        self.container?.performBackgroundTask{ [weak self] (context) in
            self?.deleteObjectsfromCoreData(context: context)
            self?.saveDataToCoreData(movies: movies, context: context)
        }
    }
    
    
    
    private func deleteObjectsfromCoreData(context: NSManagedObjectContext)
    {
        
        do{
            let objects = try context.fetch(fetchRequest)
            
            _ = objects.map({context.delete($0)})
            
            try context.save()
            
        }catch{
            print("Deleting error:\(error)")
        }
    }
    
    private func saveDataToCoreData(movies:[Movie], context:NSManagedObjectContext)
    {
        
        context.perform {
            print("Are we in main ?    \(String(describing: Thread.isMainThread))")
            for movie in movies {
                let movieEntity = MovieEntity(context: context)
                movieEntity.title = movie.title
                movieEntity.year = movie.year
                guard let rate = movie.rate else{return}
                movieEntity.rate = String(rate)
                movieEntity.posterImage = movie.posterImage
                movieEntity.backdropImage = movie.backdropImage
                movieEntity.overview = movie.overview
            }
            
            do{
                try context.save()
            }catch {
                fatalError("failure to save context:\(error)")
            }
        }
    }
}
