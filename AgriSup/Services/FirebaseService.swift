//
//  FirebaseService.swift
//  AgriSup
//
//  Created by Sonney Patel on 27/01/2021.
//

import Foundation
import Firebase

//MARK: - Protocol FirebaseServiceDelegate
protocol FirebaseServiceDelegate {
    func handleError(error: Error)
}

//MARK: - FirebaseService
class FirebaseService {
    
    var db = Firestore.firestore()

    var delegate: FirebaseServiceDelegate?
    
    func addProduct(product: Product) {
        //add product to product collection
        let productRef = db.collection(K.productCollection)
            .addDocument(data: product.createDic()!) { (error) in
            if let e = error {
                self.delegate?.handleError(error: e)
            } else {
                print("Successfully saved Supplier")
            }
        }
        
        //add productReference to Supplier
        let supplierRef = db.collection(K.supplierCollection).document(product.supplierId)
        
        supplierRef.updateData([
            "productIDs": FieldValue.arrayUnion([productRef])
        ]) { err in
            if let err = err {
                self.delegate?.handleError(error: err)
            } else {
                print("Success saving productID to firebase supplier collection")
            }
        }
        
    }
    
    func addSupplier(supplier: Supplier) {
        //add supplier to supplier collection
        db.collection(K.supplierCollection)
            .document(supplier.email)
            .setData(supplier.createDic()!) { err in
                if let err = err {
                    self.delegate?.handleError(error: err)
                } else {
                    print("Supplier successfully updated")
                }
            }
    }
    
    func addPhoto(data: Data, imageName: String) -> URL? {
        
        let imageRef = Storage
            .storage()
            .reference()
            .child("Pictures")
            .child(imageName)
        
        var resultURL: URL?
        imageRef.putData(data, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Failed to upload to Firebase \(error.localizedDescription)")
            } else {
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("Failed to download url for image \(error.localizedDescription)")
                    } else {
                        guard let url = url else {
                            print("Something else went wrong")
                            return
                        }
                        //place url of photo in supplier
                        return resultURL = url
                    }
                }
            }
        }
        
        return resultURL
    }
    
}
