//
//  AppDelegate.swift
//  Counter
//
//  Created by Maxim Bazarov on 28.12.18.
//  Copyright © 2018 Unicore. All rights reserved.
//

import UIKit
import Unicore


// MARK: Application state
struct AppState: Codable {
    let counter: Int
    let step: Int
    
    // Initial state
    static let initial = AppState(counter: 0, step: 1)
}

// MARK: - Actions

struct StepChangeRequested: Action {
    let step: Int
}

struct CounterIncreaseRequested: Action {}
struct CounterDecreaseRequested: Action {}

struct ScreenShown: Action {
    let name: String
}


// MARK: - Reducer
func reduce(_ old: AppState, with action: Action) -> AppState {
    switch action {
        
    case let payload as StepChangeRequested:
        return AppState(
            counter: old.counter,
            step: payload.step
        )
        
    case _ as CounterIncreaseRequested:
        return AppState(
            counter: old.counter + old.step,
            step: old.step
        )
        
    case _ as CounterDecreaseRequested:
        return AppState(
            counter: old.counter - old.step,
            step: old.step
        )
        
    default:return old
    }
}


let core = Core<AppState>.init(state: AppState.initial, reducer: reduce)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}

