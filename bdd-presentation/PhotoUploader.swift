import Foundation
import UIKit

protocol PhotoUploader {    
    func upload(photo: UIImage, completion: (_ success: Bool)->Void)
}
