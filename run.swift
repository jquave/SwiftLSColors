#!/usr/bin/env xcrun swift -i -sdk /Applications/Xcode6-Beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk

import Foundation

println(C_ARGC)
println(C_ARGV[1])

println("\x1B[31m");

func input() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    return NSString(data: inputData, encoding:NSUTF8StringEncoding)
}

func ask(question: String!) -> String {
  println("\(question)")
  return input()
}

var age = ask("How old are you?").toInt()

