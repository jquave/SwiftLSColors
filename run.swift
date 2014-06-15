#!/usr/bin/env xcrun swift -i -sdk /Applications/Xcode6-Beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk

import Foundation

let fileManager = NSFileManager.defaultManager()

let contents = fileManager.directoryContentsAtPath(".")

println(contents)
