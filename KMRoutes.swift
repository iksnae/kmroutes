//
//  KMRoutes.swift
//  KMRoutes
//
//  Created by Khalid on 7/17/15.
//  Copyright (c) 2015 iksnae. All rights reserved.
//

import Foundation

let kQueryReservedChars = "￼=,!$&'()*+;@?\r\n\"<>#\t :/"
let kQuerySeparator = "&"
let kQueryDivider = "="
let kQueryBegin = "?"
let kFragmentBegin = "#"


typealias RouteHandler = (params:NSDictionary)->(Bool)


class KMRoutes {
    
    static private var routes:[String:RouteHandler] = [String:RouteHandler]()
    
    static func addRoute(hostname:String, handler:RouteHandler){
        routes[hostname] = handler
    }
    
    static func routeURL(url:NSURL)->Bool{
        let queryDict = url.queryDict()
        if let routeKey = url.host {
            if let handler = routes[routeKey] {
                handler(params: queryDict)
                return true
            }else{
                return false
            }
        } else {
            return false
        }
    }
}


extension NSURL {
    func queryDict()->NSMutableDictionary
    {
        var dict = NSMutableDictionary()
        // store query params
        if let queries:[String] = self.query?.componentsSeparatedByString(kQuerySeparator) {
            for query:String in queries{
                let components = query.componentsSeparatedByString(kQueryDivider)
                if components.count == 2 {
                    let key = components[0].stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                    let val = components[0].stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                    dict.setValue(val, forKey: key!)
                }
            }
        }
        return dict;
    }
}
