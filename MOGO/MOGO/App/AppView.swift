//
//  AppView.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI

@main
struct AppView: App {
  @Environment(\.scenePhase) var scenePhase
  
  var body: some Scene {
    WindowGroup {
      
      ContentView()
        .onChange(of: scenePhase) { oldValue, newValue in
          switch newValue {
          case .active:
            print("켜짐")
          case .inactive:
            print("꺼짐")
          case .background:
            print("백그라운드에서 돌아가는 중")
          @unknown default:
            print("에러")
          }
        }
    }
  }
}
