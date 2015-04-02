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
            augmentedVC.delegate = self
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        augmentedVC.setMapRegionWithTopLeftCoordinate(CLLocationCoordinate2DMake(53.4286829,14.5559835), andBottomRightCoordinate: CLLocationCoordinate2DMake(53.4286829,14.5559835), animated: false)
    }
    
    func augmentedViewController(augmentedViewController: BLSAugmentedViewController!, viewForAnnotation annotation: BLSAugmentedAnnotation!, forUserLocation location: CLLocation!, distance: CLLocationDistance) -> BLSAugmentedAnnotationView! {
        var view = BLSAugmentedAnnotationView()
        return view
    }
    
}
