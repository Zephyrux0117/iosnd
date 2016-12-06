//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by xiongmingjing on 01/12/2016.
//  Copyright © 2016 xiongmingjing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageToolbar: UIToolbar!
    @IBOutlet weak var shareToolbar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var memes = [Meme]()
    
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "Impact", size: 40)!,
        NSStrokeWidthAttributeName: -5.0
    ]
    
    private func configTextField(_ textField: UITextField) {
        
        textField.textAlignment = .center
        textField.defaultTextAttributes = memeTextAttributes
        textField.delegate = self
        
        switch textField.tag {
        case 0:
            textField.text = "TOP"
        case 1:
            textField.text = "BOTTOM"
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTextField(topTextField)
        configTextField(bottomTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        shareButton.isEnabled = imagePickerView.image != nil
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    @IBAction func pickImage(_ sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        if sender.title == "Album" {
            imagePicker.sourceType = .photoLibrary
        } else {
            imagePicker.sourceType = .camera
        }
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
        configTextField(topTextField)
        configTextField(bottomTextField)
    }
    
    @IBAction func shareImage(_ sender: UIBarButtonItem) {
        
        let meme = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [meme], applicationActivities: nil)
        
        self.present(controller, animated: true, completion: nil)
        
        controller.completionWithItemsHandler = { activity, success, items, error in
            if success {
                self.saveMeme(meme)
            }
        }
        print(memes)
    }
    
    func saveMeme(_ memeImage: UIImage) {
        // Create the meme
        let meme = Meme(topText: topTextField.text ?? "",
                        bottomText: bottomTextField.text ?? "",
                        originalImage: imagePickerView.image!,
                        memedImage: memeImage)
        memes.append(meme)
    }
    
    func generateMemedImage() -> UIImage {
        
        imageToolbar.isHidden = true
        shareToolbar.isHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        imageToolbar.isHidden = false
        shareToolbar.isHidden = false
        
        return memedImage
    }
    
    // TextField delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let count = textField.text?.characters.count, count > 18 {
            let contoller = UIAlertController(title: "Tips", message: "Meme looks better within 18 characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            contoller.addAction(action)
            present(contoller, animated: true, completion: nil)
        }
        textField.resignFirstResponder()
        return true
    }
    
    // ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        picker.dismiss(animated: true, completion: nil)
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imagePickerView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func keyboardWillShow(_ notification:Notification) {
        if bottomTextField.isEditing {
            view.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }
    
    func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
}

