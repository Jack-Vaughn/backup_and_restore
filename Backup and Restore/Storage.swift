//
//  Storage.swift
//  Backup and Restore
//
//  Created by Vaughn, Jack on 10/4/15.
//  Copyright © 2015 Rutherford County Schools. All rights reserved.
//

import Cocoa

struct Storage {
    
    //username
    static var username: String?
    
    //directory locations
    struct Directory {
        static var user: String?
        static var desktop: String?
        static var documents: String?
        static var downloads: String?
        static var movies: String?
        static var music: String?
        static var pictures: String?
    }
    
    //directory sizes
    struct DirectorySize {
        static var user: Double?
        static var desktop: Double?
        static var documents: Double?
        static var downloads: Double?
        static var movies: Double?
        static var music: Double?
        static var pictures: Double?
    }
    
    //volume
    static var isOnVolumeRoot: Bool?
    static var volumeName: NSURL?

}
