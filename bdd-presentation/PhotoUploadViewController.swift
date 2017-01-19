//
//  PhotoUploadViewController.swift
//  bdd-presentation
//
//  Created by Paweł Dudek on 16/10/15.
//  Copyright © 2015 Paweł Dudek. All rights reserved.
//

import Foundation
import UIKit

class PhotoUploadViewController: UIViewController {
    
    let photoUploader: PhotoUploader
    
    required init(photoUploader: PhotoUploader) {
        self.photoUploader = photoUploader
        super.init(nibName: nil, bundle: nil)
        self.title = "Photo Upload"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain , target: self, action: #selector(PhotoUploadViewController.didTapRightBarButtonItem(_:)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapRightBarButtonItem(_ item: UIBarButtonItem?) {
        self.photoUploader.upload(photo: UIImage()) { (success) -> Void in
            print("Success?")
        }
    }
}
