//
//  ViewController.swift
//  InitialLatter
//
//  Created by sotsys036 on 29/07/16.
//  Copyright © 2016 sotsys036. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: SSImageView!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if txtName.text!.characters.count > 0{
            imgView.setTextToImage(txtName.text!)
        }
    }
    

    @IBAction func refreshBtnPressed(sender: AnyObject) {
        
        if txtName.text!.characters.count > 0{
            
            imgView.setTextToImage(txtName.text!)
            
        }else{
            
            let alertController = UIAlertController(title: "", message: "Please enter your full name", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

