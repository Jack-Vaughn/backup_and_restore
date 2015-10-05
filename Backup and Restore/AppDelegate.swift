//
//  AppDelegate.swift
//  Backup and Restore
//
//  Created by Vaughn, Jack on 10/3/15.
//  Copyright © 2015 Rutherford County Schools. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
    }

    func applicationWillTerminate(aNotification: NSNotification) {
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }

}

