//
//  bookmarkmapViewController.swift
//  MoodApp
//
//  Created by Macbook Air on 9/2/21.
//

import UIKit
import CoreLocation
import GoogleMaps
import GooglePlaces
import MapKit

class bookmarkmapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var gridvollectionview: UICollectionView!
    @IBOutlet weak var collectionviewww: UICollectionView!
    @IBOutlet weak var mapview: GMSMapView!
    @IBOutlet weak var mapView: UIView!
    
    @IBOutlet weak var mappView: MKMapView!
    
    
    var locationManager = CLLocationManager()
    var location: LocationModel!
    var curentPosition: CLLocationCoordinate2D!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var userPinView: MKAnnotationView!

    var isgrid = false
    var delagate = UIViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.collectionviewww.scrolld
        
        collectionviewww.accessibilityHint = "hor"
        gridvollectionview.accessibilityHint = "vertical"

        self.gridvollectionview.isHidden = true

        self.locationManager.requestAlwaysAuthorization()

            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }

        mappView.delegate = self
        mappView.mapType = .standard
        mappView.isZoomEnabled = true
        mappView.isScrollEnabled = true

            if let coor = mappView.userLocation.location?.coordinate{
                mappView.setCenter(coor, animated: true)
            }
        collectionViewSetup()
//        locationManager = CLLocationManager()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//        locationManager.distanceFilter = 50
//        locationManager.startUpdatingLocation()
//        locationManager.delegate = self
//
//        let camera = GMSCameraPosition.camera(withLatitude: 0.0,
//                                              longitude: 0.0,
//                                              zoom: zoomLevel)
//        mapview.camera = camera
//        mapview.settings.myLocationButton = false
//        mapview.isMyLocationEnabled = true
//        mapview.delegate = self
//        self.mapview.addSubview(collectionviewww)
        // Do any additional setup after loading the view.
    }

    func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        if UIDevice.current.userInterfaceIdiom == .phone{
          layout.sectionInset = UIEdgeInsets(top: spacingIphone, left: spacingIphone, bottom: spacingIphone, right: spacingIphone)
          layout.minimumLineSpacing = spacingIphone
          layout.minimumInteritemSpacing = spacingIphone
        }
        else{
          layout.sectionInset = UIEdgeInsets(top: spacingIpad, left: spacingIpad, bottom: spacingIpad, right: spacingIpad)
          layout.minimumLineSpacing = spacingIpad
          layout.minimumInteritemSpacing = spacingIpad
        }
        //layout.scrollDirection = .horizontal
        self.gridvollectionview?.collectionViewLayout = layout
      }
    @IBAction func backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func gridbtn(_ sender: Any) {
        
//        if isgrid{
//            isgrid = false
//            self.collectionviewww.isHidden = false
//            self.gridvollectionview.isHidden = true
//        }
//        else{
//            isgrid = true
//            self.collectionviewww.isHidden = true
//            self.gridvollectionview.isHidden = false
//
//        }
    }
    
}

extension bookmarkmapViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionviewww{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookmarkmapCollectionViewCell", for: indexPath) as! bookmarkmapCollectionViewCell
            
            return cell
        }
        else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! bookmarkmapCollectionViewCell
            
            return cell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCellsIphone:CGFloat = 5
        let spacingBetweenCellsIpad:CGFloat = 10
        if UIDevice.current.userInterfaceIdiom == .phone{
            let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
            if let collection = self.gridvollectionview{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width)
            }else{
                return UICollectionViewFlowLayout.automaticSize
            }
        }
        else{
            let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
            if let collection = self.gridvollectionview{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width)
            }else{
                return UICollectionViewFlowLayout.automaticSize
            }
        }
    }
    
    
    
    
    
    
}

extension bookmarkmapViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("Place name: \(place.name)")
    //print("Place ID: \(place.placeID)")
    //print("Place attributions: \(place.attributions)")
    print("place: \(place.formattedAddress)")
    print("place: \(place.addressComponents)")
    print("place: \(place.coordinate)")
   // self.mapview.clear()
   // self.lblAddress.text = place.name
    self.curentPosition = place.coordinate
    let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude,
                                          longitude: place.coordinate.longitude,
                                          zoom: zoomLevel)
    
    //mappView.animate(toLocation: place.coordinate)
    //listLikelyPlaces()
    let marker = GMSMarker(position: place.coordinate)
    marker.map = self.mapview
    
    marker.icon = #imageLiteral(resourceName: "locmarker")
    let geocoder = GMSGeocoder()
    geocoder.reverseGeocodeCoordinate(place.coordinate){response , error in
        guard let address: GMSAddress = response?.firstResult()
            else
        {
            return
        }
    let  v = address.lines!.joined(separator: "\n")
        
    marker.title = v
       // self.lblAddress.text = v
        print("place: \(v)")
        self.location = LocationModel()
        self.location.address_name = address.locality
        self.location.address = v
        self.location.street_address_1 = v
        self.location.street_address_2 = address.locality
        self.location.city = address.administrativeArea
        self.location.zipcode = address.postalCode
        self.location.address_lat = place.coordinate.latitude
        self.location.address_lng = place.coordinate.longitude
    
        
    }
    dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    
  }

}
extension bookmarkmapViewController: CLLocationManagerDelegate {

  // Handle incoming location events.
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location: CLLocation = locations.last!
    print("Location: \(location)")
    manager.stopUpdatingLocation()
    let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        mappView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
    mappView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
      //  annotation = self.MKAnnotationView
       
        annotation.coordinate = locValue
//        annotation.title = "Javed Multani"
//        annotation.subtitle = "current location"
    mappView.addAnnotation(annotation)
    

//    self.curentPosition = location.coordinate
//    let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
//                                          longitude: location.coordinate.longitude,
//                                          zoom: zoomLevel)
//
//    mapview.camera = camera
//    mapview.animate(to: camera)
    
//    if let location = locations.last{
//          let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//          let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//          self.mappView.setRegion(region, animated: true)
//      }
  }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {


        if !(annotation is MKPointAnnotation) {
            return nil
        }

        let reuseId = "test"

        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView?.image = #imageLiteral(resourceName: "locmarker")
            anView?.canShowCallout = true
        }
        else {
            anView?.annotation = annotation
        }

        return anView
    }
  // Handle authorization for the location manager.
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .restricted:
      print("Location access was restricted.")
    case .denied:
      print("User denied access to location.")
      // Display the map using the default location.
        PopupHelper.alertWithAppSetting(title: "Alert", message: "Please enable your location", controler: self)
    case .notDetermined:
      print("Location status not determined.")
    case .authorizedAlways: fallthrough
    case .authorizedWhenInUse:
      print("Location status is OK.")
    }
  }

  // Handle location manager errors.
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    locationManager.stopUpdatingLocation()
    print("Error: \(error)")
  }
}
extension bookmarkmapViewController:GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
       mapView.clear()
        //updatePlace()
        
        print("Lat: \(coordinate.latitude) & Long: \(coordinate.longitude)")
        let position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        self.curentPosition = position
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate){response , error in
            guard let address: GMSAddress = response?.firstResult()
                else
            {
                return
            }
        let  v = address.lines!.joined(separator: "\n")
        let marker = GMSMarker(position: position)
        marker.title = v
            //self.lblAddress.text = v
        marker.map = mapView
        
            marker.icon = #imageLiteral(resourceName: "locmarker")
            self.location = LocationModel()
            self.location.address_name = address.locality
            self.location.address = v
            self.location.street_address_1 = v
            self.location.street_address_2 = address.locality
            self.location.city = address.administrativeArea
            self.location.zipcode = address.postalCode
            self.location.address_lat = coordinate.latitude
            self.location.address_lng = coordinate.longitude

        }
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapView.selectedMarker = marker
        let camera = GMSCameraPosition.camera(withTarget: marker.position, zoom: zoomLevel)
        let update = GMSCameraUpdate.setCamera(camera)
        mapView.animate(with: update)
        return true
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        //self.lblAddress.text = marker.title
        self.curentPosition = marker.position
       // self.gotoBack()
        
    }
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
      //reverseGeocodeCoordinate(position.target)
    }
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
    }
    private func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
      // 1
      let geocoder = GMSGeocoder()
        
      // 2
      geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
        guard let address = response?.firstResult(), let lines = address.lines else {
          return
        }
          
        // 3
        //self.lblAddress.text = lines.joined(separator: "\n")
        self.curentPosition = address.coordinate
          
        // 4
        UIView.animate(withDuration: 0.25) {
          self.view.layoutIfNeeded()
        }
        self.mapview.animate(toLocation: address.coordinate)
      }
    }
}

