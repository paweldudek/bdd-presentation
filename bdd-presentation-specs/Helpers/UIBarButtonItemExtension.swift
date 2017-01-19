//
//  UIBarButtonItemExtension.swift
//  bdd-presentation
//
//  Created by Paweł Dudek on 16/10/15.
//  Copyright © 2015 Paweł Dudek. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    func specSimulateTap() {
        let optionalTarget: NSObject? = self.target as? NSObject
        let action = self.action
        
        if let target = optionalTarget {
            target.perform(action, with: self)
        }
        
    }
}
