//
//  CustomerPhotoViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 10/02/2021.
//

import UIKit

class CustomerPhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.photoDelegate = self
    }

    
    var customerBuilder: CustomerBuilder = CustomerBuilder.builder
    var imagePicker: UIImagePickerController!
    var firebaseService = FirebaseService()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func chooseGalleryOrPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "Open Camera or choose from gallery", message: "", preferredStyle: .alert)
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        
        let cameraAction = UIAlertAction(title: "Take a picture", style: .default) {
            (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let galleryAction = UIAlertAction(title: "Choose photo from gallery", style: .default) {
            (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if let image = imageView.image {
            
            let data = image.jpegData(compressionQuality: 1.0)!
            let imageName = "\(customerBuilder.email)-selfie"
            

            self.firebaseService.addPhoto(data: data, imageName: imageName)
            
        } else {
            //present alert
            print("There was an error, no image was selected")
        }
    }
    
}

//MARK: - ImagePickerDelegates

extension CustomerPhotoViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        
    }
}

extension CustomerPhotoViewController: FirebaseServicePhotoDelegate {
    func handleResult(url: URL) {
        self.customerBuilder.appendPhotoURL(url: url.absoluteString)
        self.performSegue(withIdentifier: K.Segues.GettingStartedCustomer.customerToDeliveryDayInfo, sender: self)
    }
}
