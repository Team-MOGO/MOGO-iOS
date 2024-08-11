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
  
  case urbanistSemiBold14
  case urbanistSemiBold18
  
  case urbanistBold17
  case urbanistBold14
  case urbanistBold18
  case urbanistBold20
  case urbanistBold22
  case urbanistBold24
  case urbanistBold26
  case urbanistBold30
  
  case ramblaBold16
  
  case pretendardBold20
  
  case pretendardMedium12
  case pretendardMedium14
  case pretendardMedium16
  
  case pretendardRegular16
  
  case pretendardLight12
  
  static let urbanistboldFont: String = "Urbanist-Bold"
  static let urbanistMediumFont: String = "UrbanistMediumFont"
  static let urbanistSemiboldFont: String = "Urbanist-SemiBold"
  static let ramblaBoldFont: String = "Rambla-Bold"
  static let pretendardBoldFont: String = "Pretendard-Bold"
  static let pretendardMediumFont: String = "Pretendard-Medium"
  static let pretendardRegularFont: String = "Pretendard-Regular"
  static let pretendardLightFont: String = "Pretendard-Light"
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
      
    case .urbanistBold24:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 24))
      
    case .urbanistBold22:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 22))
      
    case .urbanistBold20:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 20))
      
    case .urbanistBold18:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 18))
      
    case .urbanistBold26:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 26))
      
    case .urbanistBold30:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 30))

    case .urbanistBold14:
      return self
        .font(.custom(MogoFontType.urbanistboldFont, size: 14))
      
    case .urbanistSemiBold14:
      return self
        .font(.custom(MogoFontType.urbanistSemiboldFont, size: 14))
      
    case .urbanistSemiBold18:
      return self
        .font(.custom(MogoFontType.urbanistSemiboldFont, size: 18))
      
    case .ramblaBold16:
      return self
        .font(.custom(MogoFontType.ramblaBoldFont, size: 16))
      
    case .pretendardBold20:
      return self
        .font(.custom(MogoFontType.pretendardBoldFont, size: 20))
      
    case .pretendardMedium16:
      return self
        .font(.custom(MogoFontType.pretendardMediumFont, size: 16))
      
    case .pretendardMedium14:
      return self
        .font(.custom(MogoFontType.pretendardMediumFont, size: 14))
      
    case .pretendardMedium12:
      return self
        .font(.custom(MogoFontType.pretendardMediumFont, size: 12))
      
    case .pretendardRegular16:
      return self
        .font(.custom(MogoFontType.pretendardRegularFont, size: 16))
      
    case .pretendardLight12:
      return self
        .font(.custom(MogoFontType.pretendardLightFont, size: 12))
    }
  }
}
