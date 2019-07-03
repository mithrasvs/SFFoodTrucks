//
//  MapViewController.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var truckNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var specialitiesLabel: UILabel!
    @IBOutlet weak var timingsLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
//    private var foodTruckAnnotations : [FoodTruckAnnotation] = []
    
    private let presenter = MapViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let listViewBtn = UIBarButtonItem.init(title: "List", style: .plain, target: self, action: #selector(flipToListView))
        listViewBtn.tintColor = .white
        navigationItem.rightBarButtonItem = listViewBtn
        title = "Food Trucks"
        presenter.processFoodTruckAnnotations()
        configureMapView()
    }
    
    private func configureMapView(){
        var span : MKCoordinateSpan = MKCoordinateSpan()
        span.latitudeDelta = 0.5;
        span.longitudeDelta = 0.5;
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsPointsOfInterest = true
//        mapView.layer.masksToBounds = false
        let defaultCenter : CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.792103, -122.402851)
        var coordinateRegion : MKCoordinateRegion = MKCoordinateRegion.init()
        coordinateRegion.center = defaultCenter
        coordinateRegion.span = span
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.delegate = self
        perform(#selector(zoomToFitMapAnnotations), with: nil, afterDelay: 0.5)
    }
    
    @objc func zoomToFitMapAnnotations() {
        var topLeftCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()
        topLeftCoord.latitude = -90
        topLeftCoord.longitude = 180
        var bottomRightCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()
        bottomRightCoord.latitude = 90
        bottomRightCoord.longitude = -180
        for annotation: MKAnnotation in presenter.getFoodTruckAnnotations(){
            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude)
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude)
            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude)
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude)
        }
        var region: MKCoordinateRegion = MKCoordinateRegion()
        region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5
        region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5
        region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.4
        region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.4
        region = mapView.regionThatFits(region)
        MKMapView.animate(withDuration: 1.0) {
            self.mapView.setRegion(region, animated: true)
            self.mapView.showAnnotations(self.presenter.getFoodTruckAnnotations(), animated: true)
        }
    }

   @objc func flipToListView(){
    UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
         self.navigationController?.popViewController(animated: false)
    }, completion: nil)
        
    }

}

extension MapViewController : MKMapViewDelegate{
 
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

        let annotation = view.annotation as? FoodTruckAnnotation
        infoLabel.isHidden = true
        truckNameLabel.isHidden = false
        truckNameLabel.text = annotation?.foodTruckInfo.applicant
        addressLabel.isHidden = false
        addressLabel.text = annotation?.foodTruckInfo.address
        specialitiesLabel.isHidden = false
        specialitiesLabel.text = annotation?.foodTruckInfo.optionaltext
        
        if let startTime = annotation?.foodTruckInfo.starttime, let endTime = annotation?.foodTruckInfo.endtime{
            timingsLabel.isHidden = false
            timingsLabel.text = startTime + " - " + endTime
        }
    }
    
    
}
