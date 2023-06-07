////
////  TabViewModel.swift
////  Kakao-login-tutoral
////
////  Created by 봉주헌 on 2023/05/30.
////
//
//import SwiftUI
//
//struct ColorSelectionModal: View {
//    @Binding var selectedColor: Color?
//    @Binding var isPresented: Bool
//    
//    let themes: [Color]
//    
//        
//    var body: some View {
//        VStack {
//            ForEach(themes, id: \.self) { color in
//                Button(action: {
//                    selectedColor = color
//                    isPresented = false // 해당 동작이 완료되면 모달 창을 닫습니다.
//                    
//    
//                    print("선택된 색상은 \(themes) 입니다.")
//                }) {
//                    color
//                        .frame(width: 40, height: 40)
//                        .cornerRadius(20)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color(hex: 0xF193B8A), lineWidth: 2)
//                        )
//                }
//            }
//            .padding()
//        }
//        .background(Color.white) // 원하는 배경색으로 설정합니다.
//        .frame(width: 300) // 모달 창의 너비를 지정합니다.
//    }
//}
