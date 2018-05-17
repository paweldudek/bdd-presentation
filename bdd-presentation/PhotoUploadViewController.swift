import Foundation
import UIKit

class PhotoUploadViewController: UIViewController {
    
    let photoUploader: PhotoUploader
    
    required init(photoUploader: PhotoUploader) {
        self.photoUploader = photoUploader
        super.init(nibName: nil, bundle: nil)
        title = "Photo Upload"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                style: .plain ,
                target: self,
                action: #selector(PhotoUploadViewController.didTapRightBarButtonItem(_:)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapRightBarButtonItem(_ item: UIBarButtonItem?) {
        self.photoUploader.upload(photo: UIImage()) { success in
            print("Success?")
        }
    }
}
