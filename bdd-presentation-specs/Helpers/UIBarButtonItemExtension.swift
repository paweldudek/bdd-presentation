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
