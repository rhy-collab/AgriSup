//
//  PhotoService.swift
//  AgriSup
//
//  Created by Sonney Patel on 08/02/2021.
//

import UIKit


protocol PhotoServiceDelegate {
    func handleResult(data: Data)
}
class PhotoService {
    
    var photoServiceDelegate: PhotoServiceDelegate?
    
    func retrievePhoto(from urlString: String) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
//                    self.supplierImage.image = UIImage(data: data)
                    self.photoServiceDelegate?.handleResult(data: data)
                }
            }
            
            task.resume()
        }
    }
}
