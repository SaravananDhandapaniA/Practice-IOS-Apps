//
//  NetworkingService.swift
//  CoreTodoList
//
//  Created by Tringapps on 01/04/22.
//

import Foundation

class NetworkingService {
    
    private init() {}
    static let shared = NetworkingService()
    
    func request(_ urlPath: String , completeion : @escaping (Result<Data, NSError>) -> Void){
        
        let url = URL(string: urlPath)!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, _, error) in
            
            if let unwrappedError = error {
                completeion(.failure(unwrappedError as NSError))
            }
            else if let unwrappedData = data {
                completeion(.success(unwrappedData))
            }
        }
        task.resume()
    }
}
