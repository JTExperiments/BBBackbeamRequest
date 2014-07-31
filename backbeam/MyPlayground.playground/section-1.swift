// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var param = Dictionary<String, AnyObject>()

param["email"] = "user@example.com"

param["method"] = "POST"
param["nonce"] = "205f775c1822774adab2e2ae64adb6826c86a2b5"
param["path"] = "/user/email/lostPassword"
param["time"] = "1397166332031"

param

var canonical = ""

for (key, value) in param {
    canonical += "\(key)=\(value)"
}

var array = sorted(param.keys.array, <)

let describedArray = array.map { "\($0)=\(param[$0]!)" }

join(",", describedArray);

