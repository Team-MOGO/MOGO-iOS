//
//  ResultView.swift
//  MOGO
//
//  Created by 유지수 on 8/10/24.
//

import SwiftUI

struct ResultView: View {
  @AppStorage(StoreKey.pregnantDays) var pregnantDays: Int = 0
  let selectedItem: ResultItem
  @State var isClosed: Bool = false
  
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        HStack() {
          Spacer()
          Button(action: {
            self.isClosed.toggle()
          }, label: {
            Image("close")
              .resizable()
              .frame(width: 16, height: 16)
          })
        }
        .padding(.trailing, 20)
        
        HStack(spacing: 0) {
          riskLevelImage(for: selectedItem.riskLevel)
            .resizable()
            .scaledToFit()
            .frame(width: 132)
          
          VStack(alignment: .leading, spacing: 0) {
            Text("\" \(selectedItem.foodName) \"")
              .mogoFont(.urbanistSemiBold18)
              .padding(.bottom, 5)
              .padding(.leading, 13)
            
            VStack(alignment: .leading, spacing: 4) {
              HStack(spacing: 0) {
                Text("is ")
                  .mogoFont(.urbanistBold22)
                
                Text(selectedItem.riskLevel.capitalized)
                  .mogoFont(.urbanistBold22)
                  .foregroundStyle(riskLevelColor(for: selectedItem.riskLevel))
              }
              
              Text("at week \(BabyViewState.getWeek(pregnantdays: pregnantDays)) pregnancy")
                .mogoFont(.urbanistBold22)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading, 20)
            .padding(.bottom, 14)
            
            riskLevelCauseView(for: selectedItem)
              .padding(.leading, 20)
              .padding(.trailing, 2)
          }
        }
        .padding(.bottom, 43)
        
        HStack() {
          Text(selectedItem.cause)
            .mogoFont(.urbanistBold20)
          Spacer()
        }
        .padding(.horizontal, 21)
        .padding(.bottom, 12)
        
        ZStack(alignment: .center) {
          VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 4)
              .fill(Color(hex: "C6C6C6"))
              .frame(width: 2, height: 35)
              .padding(.bottom, 9)
            Text("Ideal daily amount")
              .mogoFont(.urbanistSemiBold14)
          }
          
          VStack(spacing: 0) {
            Spacer()
            ZStack(alignment: .leading) {
              GeometryReader(content: { geometry in
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color(hex: "F7F0EE"))
                  .frame(height: 16)
                
                RoundedRectangle(cornerRadius: 10)
                  .fill(
                    LinearGradient(
                      colors: [.mogoSub1, .mogoPoint],
                      startPoint: .leading,
                      endPoint: .trailing
                    )
                  )
                  .frame(height: 16)
                  .frame(width: geometry.size.width * calculateRatioOfGraph(width: geometry.size.width))
              }
              )
              .padding(.horizontal, 22)
            }
            Spacer()
          }
        }
        .padding(.top, 34)
        .padding(.bottom, 24)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(.white)
        )
        .padding(.horizontal, 19)
        .padding(.bottom, 17)
        
        Text(selectedItem.description)
          .mogoFont(.pretendardRegular16)
          .padding(.horizontal, 20)
          .padding(.bottom, 40)
        
        HStack(spacing: 0) {
          Text("Recommended Intake Per Day")
            .mogoFont(.urbanistBold20)
          Spacer()
        }
        .padding(.leading, 20)
        .padding(.bottom, 12)
        
        RoundedRectangle(cornerRadius: 21)
          .fill(.white)
          .stroke(Color(hex: "C4C3C3"), lineWidth: 0)
          .frame(height: 92)
          .overlay(
            Text(selectedItem.dailyRecommendedIntake)
              .mogoFont(.urbanistBold24)
              .foregroundStyle(.mogoGray2)
          )
          .padding(.horizontal, 22)
          .padding(.bottom, 19)
        
        HStack(spacing: 0) {
          Text("Nutrition Facts")
            .mogoFont(.urbanistBold20)
          Spacer()
        }
        .padding(.horizontal, 21)
        .padding(.bottom, 12)
        
        
        ZStack(alignment: .center) {
          RoundedRectangle(cornerRadius: 21)
            .fill(.white)
            .stroke(Color(hex: "C4C3C3"), lineWidth: 1)
          
          VStack(spacing: 0) {
            HStack(spacing: 0) {
              Text("Calories")
                .mogoFont(.pretendardBold20)
              
              Spacer()
              
              Text("\(selectedItem.nutritionFacts.calories)kcal")
                .mogoFont(.pretendardBold20)
            }
            .padding(.horizontal, 22)
            .padding(.bottom, 18)
            
            Divider()
              .background(Color(hex: "C4C3C3"))
              .padding(.bottom, 17)
            
            ForEach(selectedItem.nutritionFacts.nutritions, id: \.self) { nutrition in
              HStack(spacing: 0) {
                Text(nutrition.name)
                  .mogoFont(.pretendardMedium16)
                
                Spacer()
                
                nutritionLevelView(for: nutrition)
                  .padding(.trailing, 8)
                
                Text(nutrition.amount)
                  .mogoFont(.pretendardMedium14)
              }
              .padding(.horizontal, 22)
              .padding(.bottom, 20)
            }
          }
          .padding(.top, 20)
        }
        .padding(.horizontal, 19)
        .padding(.bottom, 40)
        
      }
      .padding(.top, 20)
      .fullScreenCover(isPresented: $isClosed) {
        MainView()
      }
      .transaction { transaction in
        transaction.disablesAnimations = true
      }
      
    }
    .ignoresSafeArea(edges: .bottom)
    .frame(maxWidth: .infinity)
    .background(.mogoBackground)
  }
}

extension ResultView {
  private func riskLevelImage(for riskLevel: String) -> Image {
    switch riskLevel {
    case "dangerous":
      return Image("RedBaby")
    case "recommended":
      return Image("GreenBaby")
    default:
      return Image("YellowBaby")
    }
  }
  
  private func riskLevelColor(for riskLevel: String) -> Color {
    switch riskLevel {
    case "dangerous":
      return .mogoRedPoint
    case "recommended":
      return .mogoGreenPoint
    default:
      return .mogoYellowPoint
    }
  }
  
  private func riskLevelCauseView(for item: ResultItem) -> some View {
    Text(item.cause)
      .mogoFont(.urbanistBold14)
      .foregroundStyle(riskLevelColor(for: item.riskLevel))
      .padding(.horizontal, 8)
      .padding(.vertical, 6)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(riskLevelBackgroundColor(for: item.riskLevel))
      )
  }
  
  private func riskLevelBackgroundColor(for riskLevel: String) -> Color {
    switch riskLevel {
    case "dangerous":
      return .mogoRedBg
    case "recommended":
      return .mogoGreenBg
    default:
      return .mogoYellowBg
    }
  }
  
  private func nutritionLevelView(for nutrition: Nutrition) -> some View {
    let levelColor: Color
    let backgroundColor: Color
    
    switch nutrition.level {
    case "Excessive":
      levelColor = .mogoRedPoint
      backgroundColor = .mogoRedBg
    case "Ideal":
      levelColor = .mogoGreenPoint
      backgroundColor = .mogoGreenBg
    default:
      levelColor = .mogoYellowPoint
      backgroundColor = .mogoYellowBg
    }
    
    return Text(nutrition.level)
      .mogoFont(.urbanistBold14)
      .lineLimit(1)
      .foregroundStyle(levelColor)
      .padding(.horizontal, 8)
      .padding(.vertical, 6)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(backgroundColor)
      )
      .fixedSize()
  }
  
  func calculateRatioOfGraph(width: Double) -> Double {
    let idealAmount = Double(selectedItem.idealAmount) // 기준
    let actualAmount = Double(selectedItem.actualAmount) // 실제
    let ratio = actualAmount / idealAmount
    switch ratio {
    case 0...2:
      return ratio / 2
    default:
      return 1
    }
  }
}


#Preview {
  ResultView(selectedItem: .dummy.first!)
}
