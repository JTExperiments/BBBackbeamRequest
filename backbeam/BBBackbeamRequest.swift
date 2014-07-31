//
//  BBBackbeamRequest.swift
//  backbeam
//
//  Created by James Tang on 28/7/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

import Foundation

class BBBackbeamRequest: NSObject {
    var key : String?
    var method : String?
    var nonce : String?
    var path : String?
    var time : String?
    var secret : String?

    var param = Dictionary<String, AnyObject>()

    func signature () -> String {
        return canonical().digest(HMACAlgorithm.SHA1, key: secret!)
    }

    func canonical () -> String {

        var keys : [AnyObject] = self.canonicalArray()
        var params = Dictionary<String, AnyObject>()

        for (key, value) in self.dictionaryWithValuesForKeys(keys) {
            params.updateValue(value, forKey: key as String)
        }
        for (key, value) in self.param {
            params.updateValue(value, forKey: key)
        }

        var array = sorted(params.keys, <)

        var mapped = array.map {
            "\($0)=\(params[$0]!)"
        }

        return join("&", mapped);
    }

    func canonicalArray () -> [String] {
        return ["key", "method", "nonce", "path", "time"]
    }

}
