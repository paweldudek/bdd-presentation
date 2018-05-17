import Foundation

import Quick
import Nimble

@testable import bdd_presentation

class MockPhotoUploader: PhotoUploader {
    
    fileprivate(set) var photoUploadCalled: Bool = false
    
    func upload(photo: UIImage, completion: (_ success: Bool) -> Void) {
        self.photoUploadCalled = true
    }
}













class PhotoUploadViewControllerSpec: QuickSpec {

    
    override func spec() {
        
        var sut: PhotoUploadViewController!
        var mockPhotoUploader: MockPhotoUploader!
        
        beforeEach {
            mockPhotoUploader = MockPhotoUploader()
            
            sut = PhotoUploadViewController(photoUploader: mockPhotoUploader)
        }
        
        afterEach {
            sut = nil
        }

        it("should have a title") {
            expect(sut.title).to(equal("Photo Upload"))
        }


        
        
        
        





        
        
        
        
        
        
        // non-bdd
        
        describe("right bar button item") {
            
            var rightBarButtonItem: UIBarButtonItem?
            
            beforeEach {
                rightBarButtonItem = sut.navigationItem.rightBarButtonItem
            }
            
            it("should be a bar button item") {
                expect(rightBarButtonItem).toNot(beNil())
            }
            
            it("should have a target") {
                expect(rightBarButtonItem?.target as? PhotoUploadViewController).to(equal(sut))
            }
            
            it("should have an action") {
                expect(rightBarButtonItem?.action).to(equal(#selector(PhotoUploadViewController.didTapRightBarButtonItem(_:))))
            }
        }
        
        describe("right bar button item action") {
            
            beforeEach {
                let rightBarButtonItem = sut.navigationItem.rightBarButtonItem
                sut.didTapRightBarButtonItem(rightBarButtonItem)
            }
            
            it("should tell the photo uploader to upload photo") {
                expect(mockPhotoUploader.photoUploadCalled).to(beTruthy())
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // bdd
        
        describe("right bar button item") {
            
            var rightBarButtonItem: UIBarButtonItem!
            
            beforeEach {
                rightBarButtonItem = sut.navigationItem.rightBarButtonItem
            }
            
            it("should be a bar button item") {
                expect(rightBarButtonItem).toNot(beNil())
            }
            
            describe("when it is tapped") {
                
                beforeEach {
                    rightBarButtonItem?.specSimulateTap()
                }
                
                it("should tell the photo uploader to upload photo") {
                    expect(mockPhotoUploader.photoUploadCalled).to(beTruthy())
                }
            }
        }
    }
}
