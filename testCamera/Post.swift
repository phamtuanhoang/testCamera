//
//  Post.swift
//  testCamera
//
//  Created by tuanhoang pham on 20/10/15.
//  Copyright © 2015 tuanhoang pham. All rights reserved.
//

import Foundation

class Post : PFObject, PFSubclassing{
    // 2
    @NSManaged var imageFile: PFFile?
    @NSManaged var user: PFUser?
    var image : UIImage?
    
    //MARK: PFSubclassing Protocol
    
    // 3
    static func parseClassName() -> String {
        return "Post"
    }
    
    // are pure boilerplate code
    override init () {
        super.init()
    }
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            // inform Parse about this subclass
            self.registerSubclass()
        }
    }
    
    //post function
    func uploadPost() {
        let imageData = UIImageJPEGRepresentation(image!, 0.8)
        let imageFile = PFFile(data: imageData!)
        imageFile!.saveInBackgroundWithBlock(nil)
        
        self.imageFile = imageFile
        saveInBackgroundWithBlock(nil)
    }

}