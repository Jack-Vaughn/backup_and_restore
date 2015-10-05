//
//  Restore Which User.swift
//  Backup and Restore
//
//  Created by Vaughn, Jack on 10/4/15.
//  Copyright © 2015 Rutherford County Schools. All rights reserved.
//

import Cocoa

class RestoreWhichUser: NSObject {
    
    func anotherUserPressed() -> Bool {
        let directoryPrompt = NSOpenPanel()
        directoryPrompt.prompt = "Select User Directory"
        directoryPrompt.canChooseDirectories = true
        directoryPrompt.canChooseFiles = false
        directoryPrompt.directoryURL = NSURL(string: "/Users/")
        directoryPrompt.runModal()
        while (Storage.DirectorySize.user == nil || Storage.DirectorySize.desktop == nil || Storage.DirectorySize.documents == nil || Storage.DirectorySize.downloads == nil || Storage.DirectorySize.movies == nil || Storage.DirectorySize.music == nil || Storage.DirectorySize.pictures == nil) {
            NSThread.sleepForTimeInterval(0.2)
        }
        let path = directoryPrompt.URL?.path!
        if ((NSURL(string: path!)?.URLByDeletingLastPathComponent?.path!)! == "/Users") {
            renewDirectories(directory: path!)
            renewDirectorySizes()
            return true
        } else {
            return false
        }
    }
    
    func renewDirectories(directory directory: String) {
        Storage.username = NSURL(string: directory)?.lastPathComponent
        Storage.Directory.user = "\(directory)/"
        Storage.Directory.desktop = "\(Storage.Directory.user!)Desktop/"
        Storage.Directory.documents = "\(Storage.Directory.user!)Documents/"
        Storage.Directory.downloads = "\(Storage.Directory.user!)Downloads/"
        Storage.Directory.movies = "\(Storage.Directory.user!)Movies/"
        Storage.Directory.music = "\(Storage.Directory.user!)Music/"
        Storage.Directory.pictures = "\(Storage.Directory.user!)Pictures/"
    }
    
    func renewDirectorySizes() {
        Storage.DirectorySize.user = nil
        Storage.DirectorySize.desktop = nil
        Storage.DirectorySize.documents = nil
        Storage.DirectorySize.downloads = nil
        Storage.DirectorySize.movies = nil
        Storage.DirectorySize.music = nil
        Storage.DirectorySize.pictures = nil
        Calculations().getDirectorySizes()
    }

}
