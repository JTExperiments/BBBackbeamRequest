//
//  ViewController.swift
//  backbeam
//
//  Created by James Tang on 28/7/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var request = BBBackbeamRequest()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        request.secret = "pro_d2483cadbe4018c2603d9ba8993663f42134ed455e5e7ffdb7c8573218d323b3cfe7d50d1c6a371f"
        request.key = "pro_3ae5e79bb30c58501b88d81e7bb23ae6440aef2a"
        request.method = "POST"
        request.nonce = "6303cd9bf27d27eb6343427ac42365b38b09f112"
        request.path = "/user/email/login"
        request.time = "1397166331409"
        request.param["email"] = "user@example.com"
        request.param["password"] = "foobarbaz"

        println("canonicalArray \(request.canonical())")
        println("request.secret \(request.secret)")
        println("request.signature \(request.signature())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

