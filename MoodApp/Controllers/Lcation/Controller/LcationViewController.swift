//
//  LcationViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import CoreLocation
import MapKit
import GoogleMaps
import GooglePlaces
class LcationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var locationManager = CLLocationManager()
    var location: LocationModel!
    var curentPosition: CLLocationCoordinate2D!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    var delagate = UIViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self

        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        //mapView.settings.myLocationButton = true
        //mapView.isMyLocationEnabled = true
        mapView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    @IBAction func doneBtnPressed(_ sender:Any){
        if self.location != nil{
            gotoBack()
        }
        else{
            PopupHelper.showAlertControllerWithError(forErrorMessage: "Please select location", forViewController: self)
        }
        
    }
    func gotoBack(){
//        switch delagate {
//        case let control as ProfileViewController:
//            control.loadLocation(self.location)
//        case let control as CartViewController:
//            control.orderProduct(self.location)
//        default:
//            break
//        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func closeBtnPressed(_ sender:Any){
        self.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LcationViewController:UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self

        // Specify the place data types to return.
        //let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
        //  UInt(GMSPlaceField.placeID.rawValue))!
        //autocompleteController.placeFields = fields

        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter

        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
        
    }
}
extension LcationViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("Place name: \(place.name)")
    //print("Place ID: \(place.placeID)")
    //print("Place attributions: \(place.attributions)")
    print("place: \(place.formattedAddress)")
    print("place: \(place.addressComponents)")
    print("place: \(place.coordinate)")
    self.mapView.annotations.forEach { anotation in
        self.mapView.removeAnnotation(anotation)
    }
    self.lblAddress.text = place.name
    self.curentPosition = place.coordinate
   
    mapView.setCenter(place.coordinate, animated: true)
    
    //listLikelyPlaces()
    let marker = MKPointAnnotation()
    marker.title = "London"
    marker.coordinate = place.coordinate
    mapView.addAnnotation(marker)

    let geocoder = GMSGeocoder()
    geocoder.reverseGeocodeCoordinate(place.coordinate){response , error in
        guard let address: GMSAddress = response?.firstResult()
            else
        {
            return
        }
    let  v = address.lines!.joined(separator: "\n")
        
    marker.title = v
        self.lblAddress.text = v
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
extension LcationViewController: CLLocationManagerDelegate {

  // Handle incoming location events.
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location: CLLocation = locations.last!
    print("Location: \(location)")
    manager.stopUpdatingLocation()
    self.curentPosition = location.coordinate
    
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: location.coordinate, span: span)
    mapView.setRegion(region, animated: true)
    let annotation = MKPointAnnotation()
    annotation.coordinate = location.coordinate
    mapView.addAnnotation(annotation)
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
extension LcationViewController:MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.glyphImage = #imageLiteral(resourceName: "Group 803")
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.selectAnnotation(view.annotation as! MKAnnotation, animated: true)
        let camera = MKMapCamera(lookingAtCenter: view.annotation!.coordinate, fromDistance: CLLocationDistance(zoomLevel), pitch: 2, heading: 2)
        mapView.camera = camera
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
        self.lblAddress.text = lines.joined(separator: "\n")
        self.curentPosition = address.coordinate
          
        // 4
        UIView.animate(withDuration: 0.25) {
          self.view.layoutIfNeeded()
        }
        self.mapView.camera.centerCoordinate = address.coordinate
      }
    }
}

