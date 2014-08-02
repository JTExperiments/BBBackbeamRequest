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
    var project : String?
    var env : String?

    var optionals = Dictionary<String, AnyObject>()

    func signature () -> String {
        return canonical().digest(HMACAlgorithm.SHA1, key: secret!)
    }

    func canonical () -> String {

        var keys : [AnyObject] = self.canonicalArray()
        var params = Dictionary<String, AnyObject>()

        for (key, value) in self.dictionaryWithValuesForKeys(keys) {
            params.updateValue(value, forKey: key as String)
        }
        for (key, value) in self.optionals {
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


    func send(completion:((NSData!, NSURLResponse!, NSError!) -> Void)!) -> Void {

        let base = "http://api-\(env!)-\(project!).backbeamapps.com"

        let component = NSURLComponents(string: base)
        component.path = path!
        component.query = canonical() + "&signature=\(signature())"

        let url = component.URL

        let task = NSURLSession.sharedSession().dataTaskWithURL(url
            , completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                completion(data, response, error)
            })
        task.resume()
    }

}
