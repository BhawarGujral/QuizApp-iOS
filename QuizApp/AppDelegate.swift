//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var questionBank = [Question]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        questionBank = [
            Question(question: "What is the capital of France?", correctOption: "Paris", incorrectOption1: "London", incorrectOption2: "Berlin", incorrectOption3: "Madrid"),
            Question(question: "Who wrote 'Hamlet'?", correctOption: "William Shakespeare", incorrectOption1: "Charles Dickens", incorrectOption2: "Leo Tolstoy", incorrectOption3: "Mark Twain"),
            Question(question: "What is the smallest planet in our solar system?", correctOption: "Mercury", incorrectOption1: "Mars", incorrectOption2: "Venus", incorrectOption3: "Earth"),
            Question(question: "What is the chemical symbol for water?", correctOption: "H2O", incorrectOption1: "O2", incorrectOption2: "H2", incorrectOption3: "CO2"),
            Question(question: "What is the largest mammal?", correctOption: "Blue Whale", incorrectOption1: "Elephant", incorrectOption2: "Giraffe", incorrectOption3: "Rhino")
        ]
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

