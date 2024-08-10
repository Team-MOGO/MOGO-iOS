//
//  Shape+Extension.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
  static var mogoBackground: Color { Color(hex: "FFFCF8") }
  
  static var mogoGray1: Color { Color(hex: "525252") }
  static var mogoGray2: Color { Color(hex: "898989") }
  static var mogoGray3: Color { Color(hex: "A7A7A7") }
  
  static var mogoPoint: Color { Color(hex: "87544D") } 
  static var mogoSub1: Color { Color(hex: "E7D5CE") }
  static var mogoSub2: Color { Color(hex: "6F605C") }
  
  static var mogoPickerBackground: Color { Color(hex: "883B28").opacity(0.8) }
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

extension UIColor {
  convenience init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    
    self.init(red: r, green: g, blue: b, alpha: 1)
  }
}
