//
//  MapView.swift
//  MapView
//
//  Created by 冯成林 on 15/9/24.
//  Copyright © 2015年 冯成林. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIView {

    @IBOutlet weak var mapView: MKMapView!
    
    lazy var locationMgr: CLLocationManager = {CLLocationManager()}()
}



extension MapView: MKMapViewDelegate{
    
    class func mapViewCreate()->MapView{
        
        return NSBundle.mainBundle().loadNibNamed("MapView", owner: nil, options: nil).first as! MapView
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        //iOS8主动申请权限
        if #available(iOS 8.0, *) {
            locationMgr.requestAlwaysAuthorization()
        }
        
        //设置地图模式
        mapView.mapType = MKMapType.Standard
        
        //设置跟踪
        mapView.userTrackingMode = MKUserTrackingMode.Follow
        
        //设置代理
        mapView.delegate = self
    }
    
    
    /** 返回用户当前定位 */
    @IBAction func meBtnAction(sender: UIButton) {
        if mapView.userLocation.location == nil {return}
        mapView.setCenterCoordinate(mapView.userLocation.location!.coordinate, animated: true)
    }
    
    
    
    /** 地图代理方法区 */
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        if userLocation.location == nil {return}
        
        userLocation.title = "您的位置"
        
        //设置用户区域
        mapView.setRegion(MKCoordinateRegionMake(userLocation.location!.coordinate, MKCoordinateSpanMake(0.01, 0.01)), animated: true)
    }
    
}





