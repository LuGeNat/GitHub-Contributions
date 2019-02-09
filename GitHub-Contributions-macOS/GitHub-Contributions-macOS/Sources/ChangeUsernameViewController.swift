//
//  ChangeUsernameViewController.swift
//  GitHub-Contributions-macOS
//
//  Created by Felix Förtsch on 09.02.19.
//  Copyright © 2019 Felix Förtsch. All rights reserved.
//

import Cocoa

class ChangeUsernameViewController: NSViewController {
    @IBOutlet weak var usernameTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func setButtonPressed(_ sender: Any) {
        self.dismiss(sender)
    }
}
