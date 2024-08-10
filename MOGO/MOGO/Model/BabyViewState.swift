//
//  PregnantState.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import Foundation
import SwiftUI

// MARK: - 임신 상태에 븐류, 관련 모든 메서드 묶음
enum BabyViewState {
  case first
  case second
  case third
  case fourth
  case fifth
  
  /// 임신 기간을 토대로 현재 임신 주기를 확인
  static func get(pregnantdays: Int) -> Self {
    switch pregnantdays {
    case 0..<50: //
      return .first
    case 50..<100:
      return .second
    case 100..<150:
      return .third
    case 150..<200:
      return .fourth
    default:
      return .fifth
    }
  }
  
  var desiredSupplement: Image {
    switch self {
    case .first:
      return Image(.folicAcid)
    case .second:
      return Image(.vitaminD)
    case .third:
      return Image(.omega)
    case .fourth:
      return Image(.iron)
    case .fifth:
      return Image(.calcium)
    }
  }
  
  var recommended: Image {
    switch self {
    case .first:
      return Image(.broccoli)
    case .second:
      return Image(.milk)
    case .third:
      return Image(.nuts)
    case .fourth:
      return Image(.greenVeggies)
    case .fifth:
      return Image(.milk)
    }
  }
  
  var notRecommended: Image {
    switch self {
    case .first:
      return Image(.caffeine)
    case .second:
      return Image(.sausage)
    case .third:
      return Image(.rawEgg)
    case .fourth:
      return Image(.highSodium)
    case .fifth:
      return Image(.caffeine)
    }
  }
  
  var rochelleBox: [Image] {
    return [self.desiredSupplement, self.recommended, self.notRecommended]
  }
  
  /// 임신 기간을 토대로 현재 임신 주차를 확인
  static func getWeek(pregnantdays: Int) -> Int {
    return pregnantdays / 7
  }
}

extension View {
  func getMothersStomachImage(_ pregnantState: BabyViewState) -> some View {
    switch pregnantState {
    case .first:
      return Image(.motherStomach1)
        .resizable()
        .scaledToFill()
        .frame(height: 92)
      
    case .second:
      return Image(.motherStomach2)
        .resizable()
        .scaledToFill()
        .frame(height: 138)
      
    case .third:
      return Image(.motherStomach3)
        .resizable()
        .scaledToFill()
        .frame(height: 173)
      
    case .fourth:
      return Image(.motherStomach4)
        .resizable()
        .scaledToFill()
        .frame(height: 208)
      
    case .fifth:
      return Image(.motherStomach5)
        .resizable()
        .scaledToFill()
        .frame(height: 254)
    }
  }
  
  func getBabyImage(_ pregnantState: BabyViewState) -> some View {
    switch pregnantState {
    case .first:
      return Image(.baby1)
        .resizable()
        .scaledToFit()
        .frame(height: 84)
        .offset(y: 20)
      
    case .second:
      return Image(.baby2)
        .resizable()
        .scaledToFit()
        .frame(height: 117)
        .offset(y: 25)
      
    case .third:
      return Image(.baby3)
        .resizable()
        .scaledToFit()
        .frame(height: 162)
        .offset(y: 35)
      
    case .fourth:
      return Image(.baby4)
        .resizable()
        .scaledToFit()
        .frame(height: 206)
        .offset(y: 45)
      
    case .fifth:
      return Image(.baby5)
        .resizable()
        .scaledToFit()
        .frame(height: 290)
        .offset(y: 60)
    }
  }
}
