import UIKit
import MapKit

class ServiceAreasController : UIViewController, MKMapViewDelegate {
  
  @IBOutlet weak var menuButton: UIBarButtonItem!
  @IBOutlet weak var mapView: MKMapView!
  
  var points = [CLLocationCoordinate2DMake(37.77505678, -122.41904497),
    CLLocationCoordinate2DMake(37.76956134, -122.41772532),
    CLLocationCoordinate2DMake(37.76981577, -122.41324067),
    CLLocationCoordinate2DMake(37.77062993, -122.41251111),
    CLLocationCoordinate2DMake(37.78942102, -122.38862872),
    CLLocationCoordinate2DMake(37.79442326, -122.39480853)]
  
  let blueColor:UIColor = UIColor(red: 0.051, green: 0.520, blue: 0.733, alpha: 1)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    menuButton.target = self.revealViewController()
    menuButton.action = Selector("revealToggle:")
    view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    
    navigationController?.navigationBar.barTintColor = blueColor
    let avenirNext:UIFont = UIFont(name: "Avenir Next", size: 20)
    let titleDict:NSDictionary = [NSFontAttributeName: avenirNext,NSForegroundColorAttributeName: UIColor.whiteColor()]
    navigationController?.navigationBar.titleTextAttributes = titleDict
    
    setupMap()
  }
  
  
  func setupMap() {
    let location = CLLocationCoordinate2D(
      latitude: 37.7833,
      longitude: -122.4000
    )
    
    let span = MKCoordinateSpanMake(0.05, 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
    mapView.setRegion(region, animated: true)
    
    let poly:MKPolygon = MKPolygon(coordinates: &points, count: 6)
    mapView.addOverlay(poly)
  }
  
  func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
    if overlay is MKPolygon {
      var polygonRenderer = MKPolygonRenderer(overlay: overlay)
      polygonRenderer.fillColor = blueColor.colorWithAlphaComponent(0.2)
      polygonRenderer.strokeColor = blueColor.colorWithAlphaComponent(0.7)
      polygonRenderer.lineWidth = 3
      return polygonRenderer
    }
    
    return nil
  }
  
}