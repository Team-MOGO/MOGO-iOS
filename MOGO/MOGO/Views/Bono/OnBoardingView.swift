//
//  OnBoardingView.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import SwiftUI

struct OnBoardingView: View {
  @Binding var isConfirm: Bool
  @State var selectedWeek: String = "0"
  @State var selectedDay: String = "0"
  
  var body: some View {
    VStack(spacing: 0) {
      Spacer()
        .frame(height: 60)
      
      Text("How many weeks\npregnant are you?")
        .mogoFont(.urbanistBold26)
        .foregroundStyle(.mogoPoint)
        .padding(.bottom, 35)
      
      Image(.onBoardingBaby)
        .padding(.bottom, 35)
      
      HStack {
        VStack(spacing: 15) {
          Text("Weeks")
            .mogoFont(.urbanistSemiBold18)
            .foregroundStyle(.mogoGray1)

          CustomPicker(
            data: (0..<40).map{ String($0) },
            selection: $selectedWeek
          )
          .frame(width: 140)
        }
        VStack(spacing: 15) {
          Text("Days")
            .mogoFont(.urbanistSemiBold18)
            .foregroundStyle(.mogoGray1)
          
          CustomPicker(
            data: (0..<8).map{ String($0) },
            selection: $selectedDay
          )
          .frame(width: 140)
        }
      }
      
      Spacer()
      
      
      Button(
        action: {
          let fullDays = (Int(selectedWeek) ?? 0) * 7 + (Int(selectedDay) ?? 0)
          
          UserDefaults().set(fullDays, forKey: StoreKey.pregnantDays)
          isConfirm = true
        },
        label: {
          RoundedRectangle(cornerRadius: 30)
            .fill(.mogoPoint)
            .padding(.horizontal, 20)
            .frame(height: 52)
            .overlay {
              HStack {
                Text("Get Started")
                  .mogoFont(.urbanistBold18)
                  .foregroundStyle(.white)
                
                Image(systemName: "arrow.forward")
                  .resizable()
                  .bold()
                  .foregroundColor(.white)
                  .scaledToFit()
                  .frame(width: 15)
              }
            }
        }
      )
      .padding(.bottom, 40)
    }
    .ignoresSafeArea(edges: .bottom)
    .frame(maxWidth: .infinity)
    .background(.mogoBackground)
  }
}

#Preview {
  OnBoardingView(isConfirm: .constant(false))
}
