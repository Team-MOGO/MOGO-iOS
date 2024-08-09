//
//  View+MogoFont.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI
import UIKit

public enum MogoFontType {
  // MARK: - 텍스트 전용 폰트타입
  case textH1
}

extension View {
  func mogoFont(_ fontStyle: MogoFontType) -> some View {
    switch fontStyle {
    case .textH1:
      return self
        .font(.custom("", size: 10))
    }
  }
}
