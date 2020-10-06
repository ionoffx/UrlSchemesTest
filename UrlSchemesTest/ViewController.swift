//
//  ViewController.swift
//  UrlSchemesTest
//
//  Created by dot on 2020/09/25.
//

import UIKit
 
class ViewController: UIViewController {

    @IBAction func buttonclick(_ sender: Any) {
        openApp(name: "another0app0schemes")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }

    //MARK: true App 설치 또는 앱 연결
      func openApp (name:String) {
        print("openApp")
          if let appUrl = URL(string: "\(name)://") {
              if UIApplication.shared.canOpenURL(appUrl) {
                  UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
              } else {
                  // app store 이동
                  openURLToAppStore(urlPath: name)
              }
          }
      }
      
      //MARK : 앱스토어로 이동
      func openURLToAppStore(urlPath : String){
        print("openURLToAppStore")
          print("url = \(urlPath)")
          if let url = URL(string: urlPath),
              UIApplication.shared.canOpenURL(url)
          {
              if #available(iOS 10.0, *) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
              } else {
                  UIApplication.shared.openURL(url)
              }
          }
      }
}

