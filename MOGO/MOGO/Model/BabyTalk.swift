//
//  BabyTalk.swift
//  MOGO
//
//  Created by 박혜운 on 8/11/24.
//

import Foundation

struct BabyTalk {
  static func random() -> String {
    let first = "Drink plenty of water \nand take enough sleep !"
    let second = "Make sure to cook meat, fish,\nand other similar foods thoroughly !"
    let third = "Reduce the intake of\ncaffeine-containing foods !"
    let fourth = "Be cautious of pineapple and papaya\nto avoid uterine contractions !"
    let fifth = "Be cautious of mugwort or peppermint\nto avoid uterine contractions !"
    let list = [fifth, second, third, fourth, fifth]
    
    return list.randomElement() ?? first
  }
}
