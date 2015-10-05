//
//  Utilities.swift
//  Backup and Restore
//
//  Created by Vaughn, Jack on 10/4/15.
//  Copyright © 2015 Rutherford County Schools. All rights reserved.
//

import Cocoa

class Utilities: NSObject {
    
    func getDirectorySize(path: String) -> Double {
        let getDirectorySize = NSTask()
        var output = [""]
        getDirectorySize.launchPath = "/usr/bin/du"
        getDirectorySize.arguments = ["-ms", path]
        let outPipe = NSPipe()
        getDirectorySize.standardOutput = outPipe
        getDirectorySize.launch()
        let outdata = outPipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String.fromCString(UnsafePointer(outdata.bytes)) {
            string = string.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
            output = string.componentsSeparatedByString("\n")
        }
        return((output[0] as NSString).doubleValue)
    }

}
