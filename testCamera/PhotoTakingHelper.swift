//
//  PhotoTakingHelper.swift
//  testCamera
//
//  Created by tuanhoang pham on 20/10/15.
//  Copyright © 2015 tuanhoang pham. All rights reserved.
//

import Foundation
import UIKit

//provide function signature with a name
typealias PhotoTakingHelperCallback = UIImage? -> Void

class PhotoTakingHelper : NSObject {
    //view controller on which alert view controller will be presented
    weak var viewController: UIViewController!
    var callback: PhotoTakingHelperCallback
    var imagePickerController: UIImagePickerController?
    
    init(viewController: UIViewController, callback: PhotoTakingHelperCallback){
        self.viewController = viewController
        self.callback = callback
        super.init()
        showPhotoSourceSelection()
    }
    func showPhotoSourceSelection(){
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo from Library", style: .Default) { (action) in
            // do nothing yet...
            self.showImagePickerController(.PhotoLibrary)
        }
        
        alertController.addAction(photoLibraryAction)
        
        // Only show camera option if rear camera is available
        if (UIImagePickerController.isCameraDeviceAvailable(.Rear)) {
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: .Default) { (action) in
                // do nothing yet...
                self.showImagePickerController(.Camera)

            }
            
            alertController.addAction(cameraAction)
        }
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    //show image picker
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType){
        imagePickerController = UIImagePickerController()
        imagePickerController!.delegate = self
        imagePickerController!.sourceType = sourceType
        self.viewController.presentViewController(imagePickerController!, animated: true, completion: nil)
    }
    
    
}

extension PhotoTakingHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Picker")
        viewController.dismissViewControllerAnimated(false, completion: nil)
        callback(image)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("Cancel")
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
