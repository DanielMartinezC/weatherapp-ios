//
//  AppDelegate.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let appConfiguration = AppConfigurationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // App customization after application launch. ie: Firebase, FF, Themes
        configureApp()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

// MARK: - Helpers
private extension AppDelegate {
    func configureApp() {
        appConfiguration.configureTheme()
        let colorScheme = UITraitCollection.current.userInterfaceStyle
        appConfiguration.changeColorScheme(to: colorScheme)
    }
}
