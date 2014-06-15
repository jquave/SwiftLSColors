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
var showHiddenFiles = false

var argCount = C_ARGC as CInt
if argCount == CInt(2) {
  var arg = C_ARGV[1] as CString
  if arg == "-h" {
    showHiddenFiles = true
  }
}



let path = "./"
//let contents = fileManager.directoryContentsAtPath(path) as String[]
var err: NSError?
var pathURL = NSURL(string: path)

var options = NSDirectoryEnumerationOptions.SkipsHiddenFiles
if !showHiddenFiles {
  options = nil
}

let contents = fileManager.contentsOfDirectoryAtURL(pathURL, includingPropertiesForKeys: nil, options: options, error: &err)

func setColor(color: String) {
  print(color)
}

for item: AnyObject in contents {
  let url: NSURL = item as NSURL
  var isDirectoryOC: ObjCBool = false
  let fullPath = "\(path)\(item)"
  fileManager.fileExistsAtPath(url.absoluteString, isDirectory: &isDirectoryOC)
  let isDirectory = isDirectoryOC as Bool

  let isExecutable = fileManager.isExecutableFileAtPath(fullPath)

  if isDirectory {
    setColor(C_RED)
  }
  else if isExecutable {
    setColor(C_BLUE)
  }
  else {
    setColor(C_RESET)
  }

  print("\(url.lastPathComponent)    ")
}

println("")

