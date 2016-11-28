//
//  ViewController.swift
//  ColorMaker By Bear
//
//  Created by xiongmingjing on 28/11/2016.
//  Copyright © 2016 xiongmingjing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var greenControl: UISlider!
    @IBOutlet weak var blueControl: UISlider!
    
    
    @IBAction func changeColorComponent(_ sender: UISlider) {
        
        let r = CGFloat(redControl.value)
        let g = CGFloat(greenControl.value)
        let b = CGFloat(blueControl.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}

