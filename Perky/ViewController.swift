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

    func optToString(_ opt: Caffeination.Opt) -> String {
        switch opt {
        case .idle:
            return "idle"
        case .display:
            return "display"
        case .disk:
            return "disk"
        case .system:
            return "system"
        case .user:
            return "user"
        case .timed(let seconds):
            return "timed(\(seconds)s)"
        case .process(let process):
            return "process(\(process))"
        }
    }
    
    @IBOutlet weak var minuteSlider: NSSlider!
    
    @IBOutlet weak var minutesLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view.
    }

    

    @IBAction func minuteSliderText(_ sender: Any) {
        
        minutesLabel.stringValue =    String(round(minuteSlider.doubleValue)).replacingOccurrences(of: ".0", with: "") + " Minutes"
    }
    
    var minutesLeft = 0
    
    @IBOutlet weak var quitButton: NSButton!
    
    @IBOutlet weak var status: NSTextField!
    
    @IBOutlet weak var caffinateButton: NSButton!
    
    
    
    @IBOutlet weak var disk: NSButton!
    
    @IBOutlet weak var system: NSButton!
    
    @IBOutlet weak var user: NSButton!
    
    @IBOutlet weak var display: NSButton!
    
    @IBOutlet weak var idle: NSButton!
    
    var caf = Caffeination()
    
    
    @IBAction func stopButton(_ sender: NSButton) {
        caf.stop()
        status.stringValue = "Stopped Caffination"
    }
    
    @IBAction func Caffeniate(_ sender: NSButton) {
        
        let minutes = round(minuteSlider.doubleValue)
        
//        Create a list that stores the devices selected in the nsbuttons
        
        var devicesList: [Caffeination.Opt] = []
            
        if idle.state == .on {
            devicesList.append(.idle)
        }
            
        if display.state == .on {
            devicesList.append(.display)
        }
            
        if disk.state == .on {
            devicesList.append(.disk)
        }
            
        if system.state == .on {
            devicesList.append(.system)
        }
            
        if user.state == .on {
            devicesList.append(.user)
        }
        
        if minutes != 0 {
            devicesList.append(.timed(minutes * 60))
        }
        
        caf = Caffeination(withOpts: devicesList)
        

        do {
            try caf.start()
            let devicesString = devicesList.map { optToString($0) }.joined(separator: ", ")
            status.stringValue = "Caffeination has Successfully Started for \(String(round(minuteSlider.doubleValue)).replacingOccurrences(of: ".0", with: "")) minutes and is set to [\(devicesString)]"
        } catch {
            status.stringValue = "Caffeination failed to start"
        }
            
        
        
    }
    
    
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

