//
//  UIViewController.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(from: AppStoryboard) -> Self {
        return from.viewController(viewControllerClass: self)
    }
    
    static func instantiateWithNavigation(from: AppStoryboard) -> UINavigationController {
        let controller = from.viewController(viewControllerClass: self)
        return UINavigationController(rootViewController: controller)
    }
}
