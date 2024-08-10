//
//  View+MogoFont.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI
import UIKit

public enum MogoFontType {
  case urbanistMedium16
  
  case urbanistSemiBold18
  
  case urbanistBold17
  case urbanistBold18
  case urbanistBold26
  case urbanistBold30
  
  case ramblaBold16
  
  static let urbanistMediumFont: String = "UrbanistMediumFont"
  static let urbanistboldFont: String = "Urbanist-Bold"
  static let urbanistSemiboldFont: String = "Urbanist-SemiBold"
  static let ramblaBoldFont: String = "Rambla-Bold"
}

extension View {
  func mogoFont(_ fontStyle: MogoFontType) -> some View {
    
    switch fontStyle {
      case .urbanistMedium16:
      return self
        .font(.custom(MogoFontType.urbanistMediumFont, size: 16))
      
    case .urbanistBold17:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 17))
      
    case .urbanistBold18:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 18))
      
    case .urbanistBold26:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 26))
      
    case .urbanistBold30:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 30))
      
    case .urbanistSemiBold18:
      return self
        .font(.custom(MogoFontType.urbanistSemiboldFont, size: 18))
      
    case .ramblaBold16:
      return self
        .font(.custom(MogoFontType.ramblaBoldFont, size: 16))
    
    }
  }
}
