//
//  ViewController.swift
//  Perky
//
//  Created by Alek Vasek on 8/3/21.
//

import Cocoa
import Foundation
import CaffeineKit
import UserNotifications

class ViewController: NSViewController {

    
    
    @IBOutlet weak var minuteSlider: NSSlider!
    
    @IBOutlet weak var minutesLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view.
    }

    

    @IBAction func minuteSliderText(_ sender: Any) {
        minutesLabel.stringValue = minuteSlider.stringValue
    }
    
    var minutesLeft = 0
    
    @IBOutlet weak var quitButton: NSButton!
    
    @IBOutlet weak var status: NSTextField!
    
    @IBOutlet weak var minuteText: NSTextField!
    
    @IBOutlet weak var caffinateButton: NSButton!
    
    @IBOutlet weak var devices: NSComboBox!
    
    @IBAction func Caffeniate(_ sender: NSButton) {
        
        let minutes = minuteSlider.doubleValue
        
        
        switch devices.stringValue {
        case "All (Idle, Disk, Display, System)":
            let caf = Caffeination(withOpts: [.idle, .display, .disk, .system, .timed(minutes * 60)])
            
            do {
                try caf.start()
                status.stringValue =  ("Caffeination has Succesfully Started for \(minutes) minutes and is set to All")
            } catch {
                status.stringValue = ("Caffeination failed to start")
            }
            
        case "Keep Only Display Awake(idle, display)":
            let caf = Caffeination(withOpts: [.idle, .display, .timed(minutes * 60)])
            do {
                try caf.start()
                status.stringValue =  ("Caffeination has Succesfully Started for \(minutes) minutes and is set to Keep Display Awake")
            } catch {
                status.stringValue = ("Caffeination failed to start")
            }
            
        default:
            let caf = Caffeination(withOpts: [.idle, .display, .disk, .system, .timed(minutes * 60)])
            do {
                try caf.start()
                status.stringValue =  ("Caffeination has Succesfully Started for \(minutes) minutes and is set to All")
            } catch {
                status.stringValue = ("Caffeination failed to start")
            }
            
        }
    }
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

