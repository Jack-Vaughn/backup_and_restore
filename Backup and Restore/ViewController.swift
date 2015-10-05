//
//  ViewController.swift
//  Backup and Restore
//
//  Created by Vaughn, Jack on 10/3/15.
//  Copyright © 2015 Rutherford County Schools. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var tabView: NSTabView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        Calculations().start()
        let task = NSTask()
        task.launchPath = "/usr/bin/sudo"
        task.arguments = ["rm", "-r", "/Users/test"]
        task.launch()
        task.waitUntilExit()
    }

    override var representedObject: AnyObject? {
        didSet {
        }
    }
    
    func goToTab(tab tab: Int) {
        tabView.selectTabViewItemAtIndex(tab - 1)
    }
    
    @IBAction func closeApp(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }
    
    //-----------------------------------Start-----------------------------------
    @IBAction func backupButtonPressed(sender: AnyObject) {
        while(Storage.isOnVolumeRoot == nil) {NSThread.sleepForTimeInterval(0.2)}
        Storage.isOnVolumeRoot = true //uncomment when done testing
        if (Storage.isOnVolumeRoot!) {
            backupWhichUserLoadRequest()
        } else {
            backupNotOnVolumeRootLoadRequest()
        }
    }
    @IBAction func restoreButtonPressed(sender: AnyObject) {
    }
    
    
    //-----------------------------------Restore Not On Volume Root-----------------------------------
    func backupNotOnVolumeRootLoadRequest() {
        goToTab(tab: Page.Backup.appNotOnVolumeRoot)
    }
    
    
    //-----------------------------------Restore Which User-----------------------------------
    @IBOutlet weak var restoreWhichUserWarningLabel: NSTextField!
    @IBOutlet weak var restoreWhichUserWarningImage: NSImageView!
    
    func backupWhichUserLoadRequest() {
        goToTab(tab: Page.Backup.whichUser)
    }
    
    @IBAction func currentUserPressed(sender: AnyObject) {
    }

    @IBAction func anotherUserPressed(sender: AnyObject) {
        if (!RestoreWhichUser().anotherUserPressed()) {
            restoreWhichUserWarningImage.hidden = false
            restoreWhichUserWarningLabel.hidden = false
        } else {
           //conitinue on
        }
    }

}

