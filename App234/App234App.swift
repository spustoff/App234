//
//  App234App.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    @AppStorage("random_id") var random_id: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationsGetStarted()
        
        OneSignal.initialize("b0d8e601-fee9-413a-a08d-4c5b2388c3d5", withLaunchOptions: launchOptions)
        OneSignal.login(random_id)
        
        Apphud.start(apiKey: "app_1hgTrgMpz2LBkFn18mAP41UJfzTQGu")
        Amplitude.instance().initializeApiKey("5cf11d64a6c4b70f3461ff21b2040b45")
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    @AppStorage("random_id") var random_id: String = ""
    
    if random_id.isEmpty {
        
        let randomId = Int.random(in: 1...99999)
        random_id = "\(randomId)"
    }
    
    var url = "https://onesignal-ba.com/api/os/no1uMtvcjS8wDYZjBFCc/"
    
    url += random_id
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App234App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
