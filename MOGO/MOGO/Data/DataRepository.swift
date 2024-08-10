//
//  DataRepository.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import Foundation

class DataRepository {
  // JSON 파일에서 데이터 읽기 (앱 번들)
  func loadFromBundle<T: Readable>(as type: T.Type) -> T? {
    guard let fileURL = Bundle.main.url(forResource: T.fileName, withExtension: "json") else {
      print("파일을 찾을 수 없습니다: \(T.fileName).json")
      return nil
    }
    
    do {
      let data = try Data(contentsOf: fileURL)
      return parse(jsonData: data, as: type)
    } catch {
      print("파일 로드 실패: \(error)")
      return nil
    }
  }
  
  // Data를 받아서 파싱하는 함수
  func parse<T: Codable>(jsonData: Data, as type: T.Type) -> T? {
    let decoder = JSONDecoder()
    
    do {
      let decodedObject = try decoder.decode(T.self, from: jsonData)
      return decodedObject
    } catch {
      print("JSON 파싱 실패: \(error)")
      return nil
    }
  }
}
