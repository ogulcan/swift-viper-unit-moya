//
//  Run.swift
//  ViperApp
//
//  Created by Oğulcan on 20.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

typealias SimpleClosure = (() -> ())

class Run {
    
    @discardableResult
    class func afterDelay(_ delayInSeconds: Double, block: @escaping ()->()) -> SimpleClosure? {
        var cancelled = false
        
        let cancelClosure: SimpleClosure = {
            cancelled = true
        }
        
        let time = DispatchTime.now() + Double(Int64(delayInSeconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: time) { () -> Void in
            if !cancelled {
                block()
            }
        }
        
        return cancelClosure
    }
    
    class func onMainThread(_ block: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) { () -> Void in
            block()
        }
    }
}
