//
//  ResultView.swift
//  MOGO
//
//  Created by 유지수 on 8/10/24.
//

import SwiftUI

struct ResultView: View {
  var resultItems: [ResultItem]
  var productCode: Int
  var pregnancyStage: Int
  
  @State private var dynamicWidth: CGFloat = 100
  
  var body: some View {
    if let selectedItem = resultItems.first(where: { $0.productCode == productCode && $0.pregnancyStage == pregnancyStage }) {
      
      ScrollView {
        VStack(spacing: 0) {
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
                
                Text("at week \(selectedItem.pregnancyStage) pregnancy")
                  .mogoFont(.urbanistBold20)
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
          
          ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
              .fill(.white)
              .stroke(Color(hex: "C4C3C3"), lineWidth: 0)
              .frame(height: 117)
              .overlay(
                VStack(spacing: 0) {
                  RoundedRectangle(cornerRadius: 4)
                    .fill(Color(hex: "C6C6C6"))
                    .frame(width: 2, height: 35)
                    .padding(.bottom, 9)
                  Text("Ideal daily amount")
                    .mogoFont(.pretendardMedium12)
                }
              )
            
            HStack(spacing: 0) {
              Spacer()
              Text("*per 100g")
                .mogoFont(.pretendardLight12)
                .padding(.trailing, 14)
                .padding(.bottom, 13)
            }
            
            // MARK: - 보노 계산해조 나 못하겟어
            VStack(spacing: 0) {
              Spacer()
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color(hex: "F7F0EE"))
                  .frame(height: 16)
                  .padding(.horizontal, 22)
                RoundedRectangle(cornerRadius: 10)
                  .fill(
                    LinearGradient(
                      colors: [.mogoSub1, .mogoPoint],
                      startPoint: .leading,
                      endPoint: .trailing
                    )
                  )
                  .frame(width: 210, height: 16)
                  .padding(.horizontal, 22)
              }
              Spacer()
            }
            .offset(y: -12)
          }
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
          .padding()
          
          
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
        }
        .padding(.top, 20)
      }
      .ignoresSafeArea(edges: .bottom)
      .frame(maxWidth: .infinity)
      .background(.mogoBackground)
    }
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
      return Color(hex: "F2414A")
    case "recommended":
      return Color(hex: "2DBD8F")
    default:
      return Color(hex: "FFA800")
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
      return Color(hex: "ffe7df")
    case "recommended":
      return Color(hex: "EFF6F1")
    default:
      return Color(hex: "FFF6CD")
    }
  }
  
  private func nutritionLevelView(for nutrition: Nutrition) -> some View {
    let levelColor: Color
    let backgroundColor: Color
    
    switch nutrition.level {
    case "Excessive":
      levelColor = Color(hex: "ff2c2c")
      backgroundColor = Color(hex: "ffe7df")
    case "Ideal":
      levelColor = Color(hex: "2DBD8F")
      backgroundColor = Color(hex: "EFF6F1")
    default:
      levelColor = Color(hex: "FFA800")
      backgroundColor = Color(hex: "FFF6CD")
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
      .padding(.leading, 20)
      .padding(.trailing, 2)
  }
}


#Preview {
  ResultView(resultItems: [
    ResultItem(productCode: 0,
               pregnancyStage: 0,
               foodName: "Chocolate Cereal",
               riskLevel: "dangerous",
               cause: "Excessive Vitamin D",
               idealAmount: 10,
               actualAmount: 12,
               description: "A 15-week-old pregnant woman has a daily intake of vitamin D of 10mg. Excessive intake of vitamin D negatively affects the development of the fetus's bone and may also affect the development of the nervous system.",
               dailyRecommendedIntake: "less than 1",
               nutritionFacts:
                NutritionFacts(calories: 393,
                               nutritions: [
                                Nutrition(name: "Carbohydrate", amount: "85g", level: "Careful"),
                                Nutrition(name: "Protein", amount: "5g", level: "Ideal"),
                                Nutrition(name: "Fat", amount: "3.67g", level: "Ideal"),
                                Nutrition(name: "Sugar", amount: "30g", level: "Excessive"),
                                Nutrition(name: "Sodium", amount: "450mg", level: "Careful"),
                                Nutrition(name: "Vitatmin A", amount: "583mg", level: "Excessive")
                               ]))
  ], productCode: 0, pregnancyStage: 0)
}
