#!/usr/bin/env xcrun swift -i -sdk /Applications/Xcode6-Beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk

import Foundation

let fileManager = NSFileManager.defaultManager()

let path = "./"
let contents = fileManager.directoryContentsAtPath(path) as String[]

for item: String in contents {
  var isDirectory: ObjCBool = false
  let fullPath = "\(path)\(item)"
  fileManager.fileExistsAtPath(fullPath, isDirectory: &isDirectory)
  println("\(fullPath): \(isDirectory)")
}
