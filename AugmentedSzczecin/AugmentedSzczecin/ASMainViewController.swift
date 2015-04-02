//
//  ASMainViewController.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 16.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASMainViewController: UIViewController, BLSAugmentedViewControllerDelegate{

    var augmentedVC: BLSAugmentedViewController!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "BLSAugmentedViewController") {
            augmentedVC = segue.destinationViewController as! BLSAugmentedViewController
            augmentedVC.setMapRegionWithTopLeftCoordinate(CLLocationCoordinate2DMake(53.43073,14.55503), andBottomRightCoordinate: CLLocationCoordinate2DMake(53.508272, 14.610112), animated: false)
            augmentedVC.delegate = self
        }
    }
    
    func augmentedViewController(augmentedViewController: BLSAugmentedViewController!, viewForAnnotation annotation: BLSAugmentedAnnotation!, forUserLocation location: CLLocation!, distance: CLLocationDistance) -> BLSAugmentedAnnotationView! {
        var view = BLSAugmentedAnnotationView()
        return view
    }
    
}
