//
//  MainView.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    Image(.quote)
    
    Text("Try to replace fried foods\nto grilled food for me !")
      .multilineTextAlignment(.center)
      .mogoFont(.ramblaBold16)
      .foregroundStyle(.mogoPoint)
  }
}

#Preview {
  MainView()
}
