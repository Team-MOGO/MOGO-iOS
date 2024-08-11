//
//  ResultModel.swift
//  MOGO
//
//  Created by 유지수 on 8/11/24.
//

import SwiftUI

struct ResultItem {
  var productCode: Int // 상품 코드
  var pregnancyStage: Int // 임신 주차 : 상품의 정보가 적용되는 주차
  var foodName: String // 식품 이름
  var riskLevel: String // 위험도
  var cause: String // 위험 원인
  var idealAmount: Int // 이상적인 영양
  var actualAmount: Int // 실제 영양
  var description: String // 설명
  var dailyRecommendedIntake: String // 하루 권고량
  var nutritionFacts: NutritionFacts // 영양 성분들
}

struct NutritionFacts {
  var calories: Int // 전체 칼로리
  var nutritions: [Nutrition] // 각 영양 성분
}

struct Nutrition : Hashable {
  var name: String // 성분명
  var amount: String // 양 (단위가 다 달라서..)
  var level: String // 성분 과잉 단계
}

extension ResultItem {
  static let dummy: [ResultItem] = [
    // 초코 시리얼
    ResultItem(productCode: 0, pregnancyStage: 0,
               foodName: "Chocolate Cereal", riskLevel: "dangerous",
               cause: "Excessive Vitamin D", idealAmount: 10, actualAmount: 833,
               description: "A 15-week-old pregnant woman has a daily intake of vitamin D of 10mg. Excessive intake of vitamin D negatively affects the development of the fetus's bone and may also affect the development of the nervous system.",
               dailyRecommendedIntake: "less than 1",
               nutritionFacts: NutritionFacts(calories: 393, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "85g", level: "Careful"),
                Nutrition(name: "Protein", amount: "5g", level: "Ideal"),
                Nutrition(name: "Fat", amount: "3.67g", level: "Ideal"),
                Nutrition(name: "Sugar", amount: "30g", level: "Excessive"),
                Nutrition(name: "Sodium", amount: "450mg", level: "Careful"),
                Nutrition(name: "Vitatmin A", amount: "583.33㎍ RAE", level: "Excessive")
               ])),
    // TOP 마스터 라떼 - 하얀색
    ResultItem(productCode: 8801037087543, pregnancyStage: 0,
               foodName: "Maxim T.O.P Master Latte", riskLevel: "alright",
               cause: "Slightly high in caffeine", idealAmount: 300, actualAmount: 99,
               description: "A caffeine content of 99mg is considered somewhat high for pregnant women. It generally accounts for about 33-50% of the recommended daily limit, which is around 200-300mg per day. With additional sources of caffeine (e.g., coffee, tea, chocolate), there is a risk of exceeding the daily recommended intake.",
               dailyRecommendedIntake: "less than 3",
               nutritionFacts: NutritionFacts(calories: 117, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "20g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Protein", amount: "2.1g", level: "Ideal"), // 단백질
                Nutrition(name: "Fat", amount: "3.2g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "19g", level: "Careful"), // 당
                Nutrition(name: "Sodium", amount: "40mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Fatty acid", amount: "2.16g", level: "Careful") // 포화지방산
               ])),
    // TOP 마스터 라떼 - 검은색
    ResultItem(productCode: 8801037001730, pregnancyStage: 0,
               foodName: "Maxim T.O.P Smoky Black", riskLevel: "alright",
               cause: "Slightly high in caffeine", idealAmount: 300, actualAmount: 99,
               description: "A caffeine content of 124mg is considered somewhat high for pregnant women. It generally accounts for about 41-62% of the recommended daily limit, which is around 200-300mg per day. With additional sources of caffeine (e.g., coffee, tea, chocolate), there is a risk of exceeding the daily recommended intake.",
               dailyRecommendedIntake: "less than 2",
               nutritionFacts: NutritionFacts(calories: 6, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "1g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Protein", amount: "0.6g", level: "Ideal"), // 단백질
                Nutrition(name: "Fat", amount: "0g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "0g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "25mg", level: "Ideal"), // 나트륨
               ])),
    // 아몬드브리즈 오리지널 - 초기
    ResultItem(productCode: 8801121763933, pregnancyStage: 1,
               foodName: "Almond Breeze Original", riskLevel: "recommended",
               cause: "Balanced nutrients", idealAmount: 2000, actualAmount: 45,
               description: "Given that this product is low in calories, fat, sodium, and sugar, and provides balanced nutrients suitable for pregnant women, it can be safely consumed. There are no particular ingredients that require caution.",
               dailyRecommendedIntake: "less than 2~3",
               nutritionFacts: NutritionFacts(calories: 45, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "5.4g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Protein", amount: "1.2g", level: "Ideal"), // 단백질
                Nutrition(name: "Fat", amount: "2.3g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "5.1g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "115mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Calcium", amount: "220g", level: "Ideal") // 포화지방산
               ])),
    // 아몬드브리즈 오리지널 - 중기
    ResultItem(productCode: 8801121763933, pregnancyStage: 2,
               foodName: "Almond Breeze Original", riskLevel: "recommended",
               cause: "Balanced nutrients", idealAmount: 2350, actualAmount: 45,
               description: "Given that this product is low in calories, fat, sodium, and sugar, and provides balanced nutrients suitable for pregnant women, it can be safely consumed. There are no particular ingredients that require caution.",
               dailyRecommendedIntake: "less than 2~3",
               nutritionFacts: NutritionFacts(calories: 45, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "5.4g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Protein", amount: "1.2g", level: "Ideal"), // 단백질
                Nutrition(name: "Fat", amount: "2.3g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "5.1g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "115mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Calcium", amount: "220g", level: "Ideal") // 포화지방산
               ])),
    // 아몬드브리즈 오리지널 - 후기
    ResultItem(productCode: 8801121763933, pregnancyStage: 3,
               foodName: "Almond Breeze Original", riskLevel: "recommended",
               cause: "Balanced nutrients", idealAmount: 2450, actualAmount: 45,
               description: "Given that this product is low in calories, fat, sodium, and sugar, and provides balanced nutrients suitable for pregnant women, it can be safely consumed. There are no particular ingredients that require caution.",
               dailyRecommendedIntake: "less than 2~3",
               nutritionFacts: NutritionFacts(calories: 0, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "5.4g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Protein", amount: "1.2g", level: "Ideal"), // 단백질
                Nutrition(name: "Fat", amount: "2.3g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "5.1g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "115mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Calcium", amount: "220g", level: "Ideal") // 포화지방산
               ])),
    // 그릭데이 시그니처 - 초기
    ResultItem(productCode: 8809762120092, pregnancyStage: 1,
               foodName: "Greekday Signature", riskLevel: "recommended",
               cause: "Rich in Protein", idealAmount: 50, actualAmount: 11,
               description: "This product is high in protein and low in sugars and sodium, making it a good source of nutrients for pregnant women. However, it is also high in fat, especially saturated fat and cholesterol, so caution is needed when consuming it.",
               dailyRecommendedIntake: "less than 1", // "About one piece" or "One serving"
               nutritionFacts: NutritionFacts(calories: 160, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "4.8g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Fat", amount: "10.69g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "1.86g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "29.87mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Cholesterol", amount: "35mg", level: "Careful") // 콜레스테롤
               ])),
    // 그릭데이 시그니처 - 중기
    ResultItem(productCode: 8809762120092, pregnancyStage: 2,
               foodName: "Greekday Signature", riskLevel: "recommended",
               cause: "Rich in Protein", idealAmount: 65, actualAmount: 11,
               description: "This product is high in protein and low in sugars and sodium, making it a good source of nutrients for pregnant women. However, it is also high in fat, especially saturated fat and cholesterol, so caution is needed when consuming it.",
               dailyRecommendedIntake: "less than 1", // "About one piece" or "One serving"
               nutritionFacts: NutritionFacts(calories: 160, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "4.8g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Fat", amount: "10.69g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "1.86g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "29.87mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Cholesterol", amount: "35mg", level: "Careful") // 콜레스테롤
               ])),
    // 그릭데이 시그니처 - 후기
    ResultItem(productCode: 8809762120092, pregnancyStage: 3,
               foodName: "Greekday Signature", riskLevel: "recommended",
               cause: "Rich in Protein", idealAmount: 80, actualAmount: 11,
               description: "This product is high in protein and low in sugars and sodium, making it a good source of nutrients for pregnant women. However, it is also high in fat, especially saturated fat and cholesterol, so caution is needed when consuming it.",
               dailyRecommendedIntake: "less than 1", // "About one piece" or "One serving"
               nutritionFacts: NutritionFacts(calories: 160, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "4.8g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Fat", amount: "10.69g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "1.86g", level: "Ideal"), // 당
                Nutrition(name: "Sodium", amount: "29.87mg", level: "Ideal"), // 나트륨
                Nutrition(name: "Cholesterol", amount: "35mg", level: "Careful") // 콜레스테롤
               ])),
    // 버드 와이저 제로
    ResultItem(productCode: 8801021229423, pregnancyStage: 0,
               foodName: "Budweiser Zero", riskLevel: "dangerous",
               cause: "May contain alcohol", idealAmount: 0, actualAmount: 0,
               description: "Non-alcoholic beer may contain some alcohol. During pregnancy, even small amounts can seriously affect the baby's brain and nervous system development, potentially causing Fetal Alcohol Syndrome (FAS), intellectual disabilities, and growth delays. It also raises the risk of miscarriage, preterm birth, low birth weight, and congenital defects.",
               dailyRecommendedIntake: "None",
               nutritionFacts: NutritionFacts(calories: 70, nutritions: [
                Nutrition(name: "Carbohydrate", amount: "16.5g", level: "Ideal"), // 탄수화물
                Nutrition(name: "Protein", amount: "1g", level: "Ideal"), // 단백질
                Nutrition(name: "Fat", amount: "0g", level: "Ideal"), // 지방
                Nutrition(name: "Sugar", amount: "0g", level: "Ideal"), // 당류
                Nutrition(name: "Sodium", amount: "10mg", level: "Ideal"), // 나트륨
               ])),
  ]
}
