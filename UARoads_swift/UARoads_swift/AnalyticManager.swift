//
//  AnalyticManager.swift
//  UARoads_swift
//
//  Created by Victor Amelin on 4/20/17.
//  Copyright © 2017 Victor Amelin. All rights reserved.
//

import UIKit

class AnalyticManager {
    private init() {}
    static let sharedInstance = AnalyticManager()
    
    //==============
    
    public func startAnalytics() {
        GAI.sharedInstance().tracker(withTrackingId: "UA-44978148-13")

        //TODO: why?
//        [Heap setAppId:@"3518989590"];
//        [Fabric with:@[[Crashlytics class]]];
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
        guard let gai = GAI.sharedInstance() else {
            assert(false, "Google Analytics not configured correctly")
        }
        gai.trackUncaughtExceptions = true
        gai.logger.logLevel = GAILogLevel.verbose  //TODO: remove before app release
    }
    
    public func identifyUser(email: String, name: String) {
        //
    }
    
    public func reportScreen(_ screenName: String) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: screenName)
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    public func reportHEAPEvent(category: String, action: String, properties: [AnyHashable:Any]) {
        //
    }
    
    public func reportEvent(category: String, action: String, label: String? = nil, value: NSNumber? = nil) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        guard let event = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: value) else { return }
        tracker.send(event.build() as [NSObject : AnyObject])
    }
}






