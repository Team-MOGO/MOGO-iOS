//
//  AppView.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI

@main
struct AppView: App {
  @State var isConfirm: Bool = false
  
  var body: some Scene {
    WindowGroup {
      if !isConfirm {
        OnBoardingView(isConfirm: $isConfirm)
      } else {
        MainView()
      }
    }
  }
}
