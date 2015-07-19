# KMRoutes #

KMRoutes is a very simple routing solution written completely in Swift.



### What is this repository for? ###

* Provides a simple interface for handling urls in iOS apps.

### How do I get set up? ###

* Copy the **KMRoutes.swift** file to your project
* Override the ```application:handleOpenURL:``` method in your AppDelegate
* Setup your route handling blocks


### Example Usage ###

```swift
// Add routing blocks
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  // Override point for customization after application launch.
  KMRoutes.addRoute("/hello", handler: { (params:NSDictionary) -> Bool in
    // the params dictionary contains query parameters
    println("hello was called with: \(params)") 
    return true
  })
  return true
}

// Override the ```application:handleOpenURL:``` method in your AppDelegate

func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
  return KMRoutes.routeURL(url)
}

```


### Roadmap ###

This module is by no means complete, nor does it cover all the cases I'd like, but it's a start. The development is driven by the needs uncovered in my own projects. More to come.