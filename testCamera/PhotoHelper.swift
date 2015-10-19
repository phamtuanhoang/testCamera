//
//  PhotoHelper.swift
//  testCamera
//
//  Created by tuanhoang pham on 19/10/15.
//  Copyright © 2015 tuanhoang pham. All rights reserved.
//


import Foundation
import UIKit

//provide function with a name, has 1 parameter return void
typealias PhotoHelperCallback = UIImage? -> Void


class PhotoHelper : NSObject{
    weak var viewController: UIViewController! //store weak reference to view controller, weak bcs do not own the reference to view controller
    var callback : PhotoHelperCallback
    var imagePickerController: UIImagePickerController?
    
    //init receives view controller on which present other view controller and call back that call as soon as user picked images
    init(viewController: UIViewController, callback: PhotoHelperCallback){
        self.viewController = viewController
        self.callback = callback
        super.init()
        showPhotoSelection()
    }
    
    func showPhotoSelection(){
        //allow user to choose btw camera + library
        let alertController = UIAlertController(title: nil, message: "Select image source", preferredStyle: .ActionSheet)
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let photoLibrary = UIAlertAction(title: "Library", style: .Default) { (UIAlertAction) -> Void in
                print("Do nothing")
        }
        alertController.addAction(photoLibrary)
        
        //show camera when it is available
        if(UIImagePickerController.isCameraDeviceAvailable(.Rear)){
            let cameraAction = UIAlertAction(title: "Photo from camera", style: .Default, handler: { (UIAlertAction) -> Void in
                print("Do nothing camera")
            })
            alertController.addAction(cameraAction)
        }
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}