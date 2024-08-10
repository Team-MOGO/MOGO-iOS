//
//  Readable.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import Foundation

protocol Readable: Codable {
  
  static var fileName: String { get }
}
