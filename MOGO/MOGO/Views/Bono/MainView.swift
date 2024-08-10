//
//  MainView.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import SwiftUI

struct MainView: View {
  @AppStorage(StoreKey.pregnantDays) var pregnantDays: Int = 0
  @State private var scannedCode: String?
  @State private var isShowingScanner = false
  @State private var rotationAngle: Double = 0
  @State private var selectedRochelleIdx: Int = 0
  let babyTalk = BabyTalk.random()
  
  var body: some View {
    let state = PregnantState
      .get(pregnantdays: pregnantDays)
    ZStack {
      VStack(spacing: 0) {
        HStack(alignment: .bottom, spacing: 8) {
          Text("Week \(PregnantState.getWeek(pregnantdays: pregnantDays))")
            .mogoFont(.urbanistBold30)
            .foregroundStyle(.mogoPoint)
          
          Text("\(280-pregnantDays) days to go")
            .mogoFont(.urbanistMedium16)
            .foregroundStyle(.mogoPoint)
            .padding(.bottom, 3)
          Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.top, 32)
        
        HStack(spacing: -10) {
          Button(
            action: {
              selectedRochelleIdx = (selectedRochelleIdx + 2) % 3
            },
            label: {
              Image(systemName: "chevron.backward")
                .frame(width: 25, height: 25)
            }
          )
          .offset(x: 30)
          .zIndex(1)
          
          state.rochelleBox[selectedRochelleIdx]
            .resizable()
            .scaledToFit()
            .frame(height: 300)
          
          Button(
            action: {
              selectedRochelleIdx = (selectedRochelleIdx + 1) % 3
            },
            label: {
              Image(systemName: "chevron.right")
                .frame(width: 25, height: 25)
            }
          )
          .offset(x: -30)
        }
        .tint(.mogoGray3)
        
        
        Button(
          action: {
            isShowingScanner = true
          },
          label: {
            RoundedRectangle(cornerRadius: 30)
              .fill(.mogoPoint)
              .frame(width: 174, height: 52)
              .overlay {
                ZStack {
                  Text("Scan")
                    .mogoFont(.urbanistBold18)
                    .foregroundStyle(.white)
                  HStack {
                    Spacer()
                    Circle()
                      .fill(.white)
                      .opacity(0.18)
                      .frame(width: 31)
                      .overlay {
                        Image(.barcode)
                      }
                      .padding(.trailing, 10)
                  }
                }
              }
          }
        )
        
        Spacer()
        
      }
    }
    
    .background {
      VStack(spacing: 0) {
        
        Spacer()
        
        Image(.quote)
          .padding(.bottom, 7)
        
        Text(babyTalk)
          .multilineTextAlignment(.center)
          .mogoFont(.ramblaBold16)
          .foregroundStyle(.mogoPoint)
          .padding(.bottom, 19)
        
        HStack(alignment: .bottom) {
          getMothersStomachImage(state)
            .overlay(alignment: .bottom) {
              getBabyImage(state)
                .rotationEffect(Angle(degrees: rotationAngle), anchor: .center)
                .animation(
                  Animation.easeInOut(duration: 2.0) // 느리게 애니메이션 설정 (1초)
                    .repeatForever(), value: rotationAngle
                )
                .onAppear {
                  rotationAngle = 10 // 회전 각도 설정
                }
            }
        }
      }
      .ignoresSafeArea(edges: .bottom)
      .sheet(isPresented: $isShowingScanner) {
        ZStack(alignment: .top) {
          BarcodeScannerView { code in
            self.scannedCode = code
            self.isShowingScanner = false
          }
          
          HStack {
            Button(
              action: {
                isShowingScanner = false
              },
              label: {
                Rectangle()
                  .fill(.clear)
                  .scaledToFit()
                  .frame(width: 24)
                  .overlay {
                    Image(systemName: "xmark")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 16)
                      .tint(.white)
                  }
              }
            )
            
            Spacer()
          }
          .padding(.all, 40)
          
          Text("Please scan the barcode of the product")
            .mogoFont(.urbanistBold17)
            .foregroundColor(.white)
            .padding(.top, 97)
        }
      }
      .background(
        .mogoBackground
      )
    }
  }
}

#Preview {
  MainView()
}
