//
//  MoviesListViewModel.swift
//  CoreMovie
//
//  Created by Tringapps on 04/04/22.
//

import Foundation
import UIKit
import CoreData

protocol UpdateTableViewDelegate: NSObjectProtocol {
    func reloadData(sender: MoviesListViewModel)
}

class MoviesListViewModel: NSObject, NSFetchedResultsControllerDelegate {
    
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    private var fetchedResultsController: NSFetchedResultsController<MovieEntity>?
    
    weak var delegate: UpdateTableViewDelegate?
    
    func retrieveDataFromCoreData() {
        
        if let context = self.container?.viewContext {
            let request: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
            
            // Sort movies by rating
            request.sortDescriptors = [NSSortDescriptor(key: #keyPath(MovieEntity.rate), ascending: false)]
            
            self.fetchedResultsController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            
            fetchedResultsController?.delegate = self
            
            do {
                try self.fetchedResultsController?.performFetch()
            } catch {
                print("Failed to initialize FetchedResultsController: \(error)")
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.delegate?.reloadData(sender: self)
    }
    
    func numberOfRowsInSection (section: Int) -> Int {
        return fetchedResultsController?.sections?[section].numberOfObjects ?? 0
    }
    
    func object (indexPath: IndexPath) -> MovieEntity? {
        return fetchedResultsController?.object(at: indexPath)
    }

}
