//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by PJ Vea on 12/12/14.
//  Copyright (c) 2014 Vea Software. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: UIView!
    
    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.loadInterface()
        
    }
    
    func loadInterface() {

        var keyboardNib = UINib(nibName: "KeyboardView", bundle: nil)

        self.keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        view.addSubview(self.keyboardView)
        
        view.backgroundColor = self.keyboardView.backgroundColor
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {

        
        
    }
    
    @IBAction func buttonPressed (sender: UIButton) {
        
        let title = sender.titleForState(.Normal)
        
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText(title!)
        
    }
    
    @IBAction func spacePressed (sender: UIButton) {
        
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText(" ")
        
    }
    
    @IBAction func deletePressed (sender: UIButton) {
        
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.deleteBackward()
        
    }

}
