//
//  HelpViewController.swift
//  Perky
//
//  Created by Alek Vasek on 8/18/21.
//

import Cocoa

class HelpViewController: NSViewController {

    
    
    @IBOutlet weak var version: NSTextField!
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        version.stringValue = appVersion!
    }
    
}
