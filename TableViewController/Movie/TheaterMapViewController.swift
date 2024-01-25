//
//  TheaterMapViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/15.
//

import UIKit
import MapKit
import Toast

enum status {
    case notDetermined
    case denied
    case authorizedWhenInUse
}

class TheaterMapViewController: UIViewController {

    @IBOutlet var theaterMapView: MKMapView!
    @IBOutlet var locationButton: UIButton!
    
    let locationManager = CLLocationManager()
    let theater = TheaterList().mapAnnotations
    
    var locationStatus = CLAuthorizationStatus.notDetermined

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationButton.setTitle("위치", for: .normal)
        
        locationManager.delegate = self

        configureView()
        
        TheaterManager.shared.mapSetting(theaterType: "전체보기", mapView: theaterMapView) { result in
            self.theaterMapView = result
        }
        
        checkDeviceLocationAuthorization()
    }
    
    @objc func RightBarButtonItemClicked() {
        print(#function)
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        let lotteButton = UIAlertAction(title: "롯데시네마", style: .default) { lotteButton in
            TheaterManager.shared.mapSetting(theaterType: "롯데시네마", mapView: self.theaterMapView) { result in
                self.theaterMapView = result
            }
        }
        let megaboxButton = UIAlertAction(title: "메가박스", style: .default) { megaboxButton in
            TheaterManager.shared.mapSetting(theaterType: "메가박스", mapView: self.theaterMapView) { result in
                self.theaterMapView = result
            }

        }
        let cgvButton = UIAlertAction(title: "CGV", style: .default) { cgvButton in
            TheaterManager.shared.mapSetting(theaterType: "CGV", mapView: self.theaterMapView) { result in
                self.theaterMapView = result
            }

        }
        let allButton = UIAlertAction(title: "전체보기", style: .default) {
            allButton in
            TheaterManager.shared.mapSetting(theaterType: "전체보기", mapView: self.theaterMapView) { result in
                self.theaterMapView = result
            }
        }
        
        alert.addAction(cancelButton)
        alert.addAction(lotteButton)
        alert.addAction(megaboxButton)
        alert.addAction(cgvButton)
        alert.addAction(allButton)

        present(alert, animated: true)
    }
    
    @IBAction func appearLocation(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
    }
    

}

extension TheaterMapViewController: ViewProtocol {
    func configureView() {
        let button = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(RightBarButtonItemClicked))

        button.tintColor = .black
        navigationItem.rightBarButtonItem = button
    }
}

extension TheaterMapViewController {
   // 1) 사용자에게 권한 요청을 하기 위해, iOS 위치 서비스 활성화 여부 체크
    func checkDeviceLocationAuthorization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {

                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *){
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져 있어서, 위치 권한을 요청할 수 없습니다")
            }
        }
    }
    
    // 2) 사용자 위치 권한 상태(동의, 거부 -> alert, 한번만 동의, 미결정 -> 권한 문구) 확인 후, 권한 요청
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("notDetermined")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationStatus = CLAuthorizationStatus.notDetermined
        case .denied:
            print("denied")
            locationStatus = CLAuthorizationStatus.denied
            showLocationSettingAlert()
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationStatus = CLAuthorizationStatus.authorizedWhenInUse
        default: print("Error")
        }
    }
    
    //3) 설정으로 이동 Alert
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in

            if let setting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(setting)
            } else {
                print("설정으로 가주세용~!")
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "내 위치😆"
        theaterMapView.addAnnotation(annotation)
        theaterMapView.setRegion(region, animated: true)
    }
    
    
}


//3. 위치 프로토콜 선언
extension TheaterMapViewController: CLLocationManagerDelegate {
    
    //5. didUpdateLocations: 사용자의 위치를 성공적으로 가지고 온 경우에 실행이 됨
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            print(coordinate.latitude)
            print(coordinate.longitude)

            setRegionAndAnnotation(center: coordinate)
        }

        locationManager.stopUpdatingLocation()
    }
    
    //6. didFailWithError: 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //default로 위치를 정해주거나 하면 될 듯
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: 37.6543906, longitude: 127.049883)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        annotation.coordinate = coordinate
        annotation.title = "새싹🌱"
        
        var style = ToastStyle()

        style.messageColor = .white

        self.view.makeToast("위치 서비스가 꺼져있으므로, 새싹🌱으로 이동합니다", duration: 2.0, position: .bottom, style: style)
        
        theaterMapView.addAnnotation(annotation)
        theaterMapView.setRegion(region, animated: true)
         
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }

}


