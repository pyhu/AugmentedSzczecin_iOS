//
//  ASMainViewController.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 16.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASMainViewController: BLSAugmentedViewController, BLSAugmentedViewControllerDelegate {
    
    override func viewWillAppear(animated: Bool) {
        self.setMapRegionWithTopLeftCoordinate(CLLocationCoordinate2DMake(53.4286829,14.5559835), andBottomRightCoordinate: CLLocationCoordinate2DMake(53.4286829,14.5559835), animated: false)
    }
    
    func augmentedViewController(augmentedViewController: BLSAugmentedViewController!, viewForAnnotation annotation: BLSAugmentedAnnotation!, forUserLocation location: CLLocation!, distance: CLLocationDistance) -> BLSAugmentedAnnotationView! {
        return BLSAugmentedAnnotationView()
    }
    
}
