//
//  PhotoUploadViewControllerSpec.swift
//  mobilization-2015
//
//  Created by Paweł Dudek on 16/10/15.
//  Copyright © 2015 Paweł Dudek. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import bdd_presentation

class FakePhotoUploader: PhotoUploader {
    
    private(set) var photoUploadCalled: Bool = false
    
    func uploadPhoto(photo: UIImage, completion: (success: Bool) -> Void) {
        self.photoUploadCalled = true
    }
}













class PhotoUploadViewControllerSpec: QuickSpec {
    
    
    
    
    override func spec() {
        
        var sut: PhotoUploadViewController!
        var fakePhotoUploader: FakePhotoUploader!
        
        beforeEach {
            fakePhotoUploader = FakePhotoUploader()
            
            sut = PhotoUploadViewController(photoUploader: fakePhotoUploader)
        }

        it("should have a title") {
            expect(sut.title).to(equal("Photo Upload"))
        }

        afterEach {
           sut = nil
        }

        
        
        
        





        
        
        
        
        
        
        // non-bdd
        
        describe("right bar button item") {
            
            var rightBarButtonItem: UIBarButtonItem!
            
            beforeEach {
                rightBarButtonItem = sut.navigationItem.rightBarButtonItem
            }
            
            it("should be a bar button item") {
                expect(rightBarButtonItem).to(beAKindOf(UIBarButtonItem))
            }
            
            it("should have a target") {
                expect(rightBarButtonItem?.target as? PhotoUploadViewController).to(equal(sut))
            }
            
            it("should have an action") {
                expect(rightBarButtonItem?.action).to(equal(Selector("didTapRightBarButtonItem:")))
            }
        }
        
        describe("right bar button item action") {
            
            beforeEach {
                let rightBarButtonItem = sut.navigationItem.rightBarButtonItem
                sut.didTapRightBarButtonItem(rightBarButtonItem)
            }
            
            it("should tell the photo uploader to upload photo") {
                expect(fakePhotoUploader.photoUploadCalled).to(beTruthy())
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // bdd
        
        describe("right bar button item") {
            
            var rightBarButtonItem: UIBarButtonItem!
            
            beforeEach {
                rightBarButtonItem = sut.navigationItem.rightBarButtonItem
            }
            
            it("should be a bar button item") {
                expect(rightBarButtonItem).to(beAKindOf(UIBarButtonItem))
            }
            
            describe("when it is tapped") {
                
                beforeEach {
                    rightBarButtonItem?.specSimulateTap()
                }
                
                it("should tell the photo uploader to upload photo") {
                    expect(fakePhotoUploader.photoUploadCalled).to(beTruthy())
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
    }
}
