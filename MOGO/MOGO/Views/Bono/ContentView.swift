//
//  ContentView.swift
//  MOGO
//
//  Created by 박혜운 on 8/9/24.
//

import SwiftUI

// 8801037028720

struct ContentView: View {
  @State private var scannedCode: String?
  @State private var isShowingScanner = false
  
  var body: some View {
    VStack(spacing: 20) {
      if let scannedCode = scannedCode {
        Text("Scanned Code: \(scannedCode)")
          .font(.title)
          .padding()
      } else {
        Text("No code scanned yet")
          .font(.title)
          .padding()
      }
      
      Button("Scan Barcode") {
        isShowingScanner = true
      }
      .font(.title)
      .padding()
      .sheet(isPresented: $isShowingScanner) {
        ZStack {
          BarcodeScannerView { code in
            self.scannedCode = code
            self.isShowingScanner = false
          }
          
          Rectangle()
            .stroke(lineWidth: 3)
            .padding(.horizontal, 20)
            .frame(height: 200)
          
          Text("하이")
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
