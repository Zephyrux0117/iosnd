//
//  ViewController.swift
//  Record
//
//  Created by xiongmingjing on 29/11/2016.
//  Copyright © 2016 xiongmingjing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func popImagePicker(_ sender: UIButton) {
        let nextController = UIImagePickerController()
        self.present(nextController, animated: true, completion: nil)
    }


}

