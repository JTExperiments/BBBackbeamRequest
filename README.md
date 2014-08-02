BBBackbeamRequest
=================

Recreating [Backbeam.io Restful-API](http://backbeam.github.io/content/rest-api.html) in Swift, as an excercise.
Now only supports GET requests and entities listing without specific `:id`.

Usage
```swift
var request = BBBackbeamRequest()
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
```
