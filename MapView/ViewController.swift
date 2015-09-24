//
//  ViewController.swift
//  MapView
//
//  Created by 冯成林 on 15/9/24.
//  Copyright © 2015年 冯成林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var mapView: MapView = {MapView.mapViewCreate()}()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.frame=UIScreen.mainScreen().bounds
        view.addSubview(mapView)
         
    }


}

