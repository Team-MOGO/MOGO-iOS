//
//  CustomPicker.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import Foundation
import SwiftUI

struct CustomPicker: UIViewRepresentable {
  var data: [String]
  @Binding var selection: String
  
  func makeUIView(context: Context) -> UIPickerView {
    let picker = UIPickerView(frame: .zero)
    
    //뷰가 고유 크기보다 커지는 것을 방지하는 우선 순위를 설정
    picker.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    
    picker.dataSource = context.coordinator
    picker.delegate = context.coordinator
    return picker
  }
  
  //뷰 업데이트
  func updateUIView(_ uiView: UIPickerView, context: Context) {
    //selection 초기 값 설정
    if let selectedIndex = data.firstIndex(of: selection) {
      uiView.selectRow(selectedIndex, inComponent: 0, animated: false)
    }
    uiView.reloadAllComponents()
  }
  
  func makeCoordinator() -> CustomPicker.Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var parent: CustomPicker
    
    init(_ CustomPickerView: CustomPicker) {
      self.parent = CustomPickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1 // 각 CustomPickerView에 대해 한 개의 컴포넌트만 필요
    }
    
    //각 컴포넌트안에 담긴 row데이터 개수 받아오기
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return self.parent.data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
      
      let view = UIView(frame: CGRect(x: 0, y: 0, width: 109, height: 48))
      let rowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
      
      rowLabel.text = self.parent.data[row]
      rowLabel.textAlignment = .center
      
      //selections영역 색 없애기
      pickerView.subviews[1].backgroundColor = UIColor(hex: "883B28").withAlphaComponent(0.2)
      pickerView.subviews[1].layer.cornerRadius = 20
      pickerView.subviews[1].layer.masksToBounds = true

      rowLabel.font = UIFont(name: "Urbanist-Bold", size: 26) ?? UIFont()
      
      //selection된 font weight 변경
      if rowLabel.text == self.parent.selection{
        rowLabel.textColor = UIColor(hex: "6F605C")
        
      } else {
        rowLabel.textColor = UIColor(hex: "A7A7A7")
      }
      
      view.addSubview(rowLabel)
      return view
    }
    
    //행(row값) 높이 설정하기
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 48
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      self.parent.selection = self.parent.data[row]
    }
  }
}
