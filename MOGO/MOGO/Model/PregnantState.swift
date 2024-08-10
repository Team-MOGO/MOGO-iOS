//
//  PregnantState.swift
//  MOGO
//
//  Created by 박혜운 on 8/11/24.
//

import Foundation

enum PregnantState: Int {
  case 무관 = 0
  case 초기
  case 중기
  case 후기
  
  static func get(pregnantdays: Int) -> Self {
    switch pregnantdays {
    case 0..<94:
      return .초기
    case 94..<187:
      return .중기
    case 187..<281:
      return .후기
    default: return .무관
    }
  }
  
  static let pregnantFullDays = 280
}
