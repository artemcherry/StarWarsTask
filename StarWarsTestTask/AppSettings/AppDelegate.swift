//
//  AppDelegate.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let builder = MainBuilder()
        let router = MainRouter(builder: builder)
        
        guard let mainScreen = builder.createMovieListScreen(router: router)  else { return false }
        let rootVC  = UINavigationController(rootViewController: mainScreen)
        router.navigationController = rootVC

        window.rootViewController = rootVC
       
        window.makeKeyAndVisible()
        self.window = window
      
        return true
    }
}

