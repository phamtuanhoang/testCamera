//
//  FirstViewController.swift
//  testCamera
//
//  Created by tuanhoang pham on 19/10/15.
//  Copyright © 2015 tuanhoang pham. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var photoHelper : PhotoHelper?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tabBarController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takePhoto(){
        //instantiate photo taking class, provide callback
        let photoHelper = PhotoHelper(viewController: self.tabBarController!) { (image: UIImage?) -> Void in
            //using trailing closure
            print("in photo helper class")
        }
    }
}


extension FirstViewController: UITabBarControllerDelegate{
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (viewController is SecondViewController) {
            takePhoto()
            return false
        } else {
            return true
        }
    }
}


