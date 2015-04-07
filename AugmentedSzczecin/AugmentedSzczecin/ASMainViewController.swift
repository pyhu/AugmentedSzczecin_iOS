//
//  ASMainViewController.swift
//  AugmentedSzczecin
//
//  Created by Patronage on 16.03.2015.
//  Copyright (c) 2015 BLStream. All rights reserved.
//

import UIKit

class ASMainViewController: BLSAugmentedViewController, BLSAugmentedViewControllerDelegate {
    
    var isConnectedToNetwork: Bool?
    var isGPSEnabled: Bool?
    
    @IBOutlet weak var mapChoiceSegmentedControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        self.setMapRegionWithTopLeftCoordinate(CLLocationCoordinate2DMake(53.4294687,14.5556164), andBottomRightCoordinate: CLLocationCoordinate2DMake(53.4288305,14.5561803), animated: false)
        isConnectedToNetwork = Reachability.isConnectedToNetwork()
        isGPSEnabled = CLLocationManager.locationServicesEnabled()
    }
    
    func augmentedViewController(augmentedViewController: BLSAugmentedViewController!, viewForAnnotation annotation: BLSAugmentedAnnotation!, forUserLocation location: CLLocation!, distance: CLLocationDistance) -> BLSAugmentedAnnotationView! {
        return BLSAugmentedAnnotationView()
    }
    
    @IBAction func mapTypeChange(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            self.style = BLSAugmentedViewControllerStyle.Map
        } else if (sender.selectedSegmentIndex == 1) {
            self.style = BLSAugmentedViewControllerStyle.AR
        }
    }
}