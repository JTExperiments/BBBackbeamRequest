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

        request.secret = "<# your app's secret #>"
        request.key = "<# your app's key #>"
        request.method = "GET"
        request.nonce = "6303cd9bf27d27eb6343427ac42365b38b09f112"
        request.path = "/data/user"   // customize to your entity
        request.time = "1397166331409"
        request.env = "dev"
        request.project = "<# your project #>"
        request.optionals["limit"] = 1

        request.send { (data, response, error) in
            println("data \(data), response \(response), error \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

