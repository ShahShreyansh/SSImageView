//
//  SSImageView.swift
//  InitialLatter
//
//  Created by sotsys036 on 29/07/16.
//  Copyright © 2016 sotsys036. All rights reserved.
//

import UIKit

class SSImageView: UIImageView {

    private var textFontSize : CGFloat = 15.0
    private var textFontName : String = "Helvetica Neue"
    private var isRounded : Bool = false
    //private var bgColor : UIColor = UIColor.clearColor();
    
    private var arrColors = [UIColor.redColor(),UIColor.blueColor(),UIColor.blackColor(),UIColor.brownColor(),UIColor.darkGrayColor()]
    
    @IBInspectable internal var fontSize : CGFloat = 15.0{
        didSet{
            self.textFontSize = fontSize
        }
    }
    
    
    @IBInspectable internal var rounded : Bool = false{
        didSet{
            self.isRounded = rounded
        }
    }
    
    func setTextToImage(originalText : String) {
        
        let dictAttribute : [String : AnyObject] = [NSFontAttributeName:UIFont.systemFontOfSize(fontSize),NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        let strTextSize = getInitialLetters(originalText).sizeWithAttributes(dictAttribute)
        
        let imgBounds = self.bounds
        
        let newRect = CGRectMake(imgBounds.size.width / 2 - strTextSize.width / 2,imgBounds.size.height / 2 - strTextSize.height / 2 , strTextSize.width, strTextSize.height)
        
        UIGraphicsBeginImageContextWithOptions(imgBounds.size, false, 2.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        if isRounded{
            
            let imgVWpath = CGPathCreateWithEllipseInRect(self.bounds, nil)
            CGContextAddPath(context, imgVWpath)
            CGContextClip(context)
            
        }else{
            
            self.layer.cornerRadius = 5.0
            
        }
        
        self.clipsToBounds = true;
        
        CGContextSetFillColorWithColor(context, getRandamColor().CGColor)
        
        CGContextFillRect(context, CGRectMake(0, 0, imgBounds.size.width, imgBounds.size.height))
        
        getInitialLetters(originalText).drawInRect(newRect, withAttributes: dictAttribute)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        self.image = img
        
    }
    
    private func getInitialLetters(stringName : String) -> NSString{
        
        var displayString = ""

        let arrWords  = stringName.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if arrWords.count > 0{
            
            for str in arrWords{
                displayString = displayString + String(str.characters.first!)
            }
            
        }else{
            displayString = String(stringName.characters.first)
        }
        
        return displayString.uppercaseString
        
    }
    
    private func getRandamColor() -> UIColor{
        srand48(Int(arc4random()));
        
        var redColor : Float = 0.0
        while(redColor < 0.1 || redColor > 0.84){
            redColor = Float(drand48());
        }
        
        var greenColor : Float = 0.0
        while(greenColor < 0.1 || greenColor > 0.84){
            greenColor = Float(drand48())
        }
        
        var blueColor : Float = 0.0
        while (blueColor < 0.1 || blueColor > 0.84){
            blueColor = Float(drand48())
        }
        
        return UIColor(red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
    }
    
}
