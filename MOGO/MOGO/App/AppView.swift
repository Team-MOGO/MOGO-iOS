//
//  AppView.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI

@main
struct AppView: App {
  @AppStorage(StoreKey.isAppeared) var isAppeared: Bool = false
  
  var body: some Scene {
    WindowGroup {
      if !isAppeared {
        OnBoardingView()
      } else {
        MainView()
      }
    }
  }
}
