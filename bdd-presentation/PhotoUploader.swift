//
//  PhotoUploader.swift
//  bdd-presentation
//
//  Created by Paweł Dudek on 16/10/15.
//  Copyright © 2015 Paweł Dudek. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoUploader {    
    func upload(photo:UIImage, completion: (_ success: Bool)->Void)
}
