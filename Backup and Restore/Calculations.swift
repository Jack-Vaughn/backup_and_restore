//
//  Calculations.swift
//  Backup and Restore
//
//  Created by Vaughn, Jack on 10/4/15.
//  Copyright © 2015 Rutherford County Schools. All rights reserved.
//

import Cocoa

class Calculations: NSObject {
    
    func start() {
        let dispatchQueue = dispatch_queue_create("org.rcsnc.begin_calculations", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(dispatchQueue) {
            //instant functions
            self.getUsername()
            self.getVolumeName()
            self.getIsOnVolumeRoot()
            self.getDirectoryPaths()
            
            //time intensive functions
            self.getDirectorySizes()
        }
    }
    
    //instant functions
    func getUsername() {
        Storage.username = NSUserName()
    }
    
    func getVolumeName() {
        Storage.volumeName = NSBundle.mainBundle().bundleURL.URLByDeletingLastPathComponent!
    }
    
    func getIsOnVolumeRoot() {
        let shouldBeVolume = Storage.volumeName!.URLByDeletingLastPathComponent!.path!
        if shouldBeVolume == "/Volume" {
            Storage.isOnVolumeRoot = true
        } else {
            Storage.isOnVolumeRoot = false
        }
    }
    
    func getDirectoryPaths() {
        Storage.Directory.user = "/Users/\(Storage.username!)/"
        Storage.Directory.desktop = "\(Storage.Directory.user!)Desktop/"
        Storage.Directory.documents = "\(Storage.Directory.user!)Documents/"
        Storage.Directory.downloads = "\(Storage.Directory.user!)Downloads/"
        Storage.Directory.movies = "\(Storage.Directory.user!)Movies/"
        Storage.Directory.music = "\(Storage.Directory.user!)Music/"
        Storage.Directory.pictures = "\(Storage.Directory.user!)Pictures/"
    }
    
    //time intensive functions
    func getDirectorySizes() {
        dispatch_async(dispatch_queue_create("org.rcsnc.user", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
            size = Utilities().getDirectorySize(Storage.Directory.user!)
            }
            Storage.DirectorySize.user = size
        }
        dispatch_async(dispatch_queue_create("org.rcsnc.desktop", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
                size = Utilities().getDirectorySize(Storage.Directory.desktop!)
            }
            Storage.DirectorySize.desktop = size
        }
        dispatch_async(dispatch_queue_create("org.rcsnc.documents", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
                size = Utilities().getDirectorySize(Storage.Directory.documents!)
            }
            Storage.DirectorySize.documents = size
        }
        dispatch_async(dispatch_queue_create("org.rcsnc.downloads", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
                size = Utilities().getDirectorySize(Storage.Directory.downloads!)
            }
            Storage.DirectorySize.downloads = size
        }
        dispatch_async(dispatch_queue_create("org.rcsnc.movies", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
                size = Utilities().getDirectorySize(Storage.Directory.movies!)
            }
            Storage.DirectorySize.movies = size
        }
        dispatch_async(dispatch_queue_create("org.rcsnc.music", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
                size = Utilities().getDirectorySize(Storage.Directory.music!)
            }
            Storage.DirectorySize.music = size
        }
        dispatch_async(dispatch_queue_create("org.rcsnc.pictures", DISPATCH_QUEUE_CONCURRENT)) {
            var size: Double = 0
            while (size == 0) {
                size = Utilities().getDirectorySize(Storage.Directory.pictures!)
            }
            Storage.DirectorySize.pictures = size
        }
    }

}
