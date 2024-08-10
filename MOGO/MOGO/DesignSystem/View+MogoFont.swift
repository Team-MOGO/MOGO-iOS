//
//  View+MogoFont.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI
import UIKit

public enum MogoFontType {
  case urbanistSemiBold18
  
  case urbanistBold18
  case urbanistBold26
  
  case ramblaBold16
  
  static let urbanistboldFont: String = "Urbanist-Bold"
  static let urbanistSemiboldFont: String = "Urbanist-SemiBold"
  static let ramblaBoldFont: String = "Rambla-Bold"
}

extension View {
  func mogoFont(_ fontStyle: MogoFontType) -> some View {
    switch fontStyle {
    case .urbanistBold26:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 26))
      
    case .urbanistBold18:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 18))
      
    case .urbanistSemiBold18:
      return self
        .font(.custom(MogoFontType.urbanistSemiboldFont, size: 18))
      
    case .ramblaBold16:
      return self
        .font(.custom(MogoFontType.ramblaBoldFont, size: 16))
    }
  }
}
