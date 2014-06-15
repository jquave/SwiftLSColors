#!/usr/bin/env xcrun swift -i -sdk /Applications/Xcode6-Beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk

import Foundation

let C_RED     = "\x1b[31m"
let C_GREEN   = "\x1b[32m"
let C_YELLOW  = "\x1b[33m"
let C_BLUE    = "\x1b[34m"
let C_MAGENTA = "\x1b[35m"
let C_CYAN    = "\x1b[36m"
let C_RESET   = "\x1b[0m"


let fileManager = NSFileManager.defaultManager()

let path = "./"
let contents = fileManager.directoryContentsAtPath(path) as String[]

func setColor(color: String) {
  print(color)
}

for item: String in contents {
  var isDirectoryOC: ObjCBool = false
  let fullPath = "\(path)\(item)"
  fileManager.fileExistsAtPath(fullPath, isDirectory: &isDirectoryOC)
  let isDirectory = isDirectoryOC as Bool
  if isDirectory {
    setColor(C_RED)
  }
  else {
    setColor(C_RESET)
  }

  println(item)

}

