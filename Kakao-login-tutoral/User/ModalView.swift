//
//  ModalView.swift
//  Kakao-login-tutoral
//
//  Created by 봉주헌 on 2023/05/23.
//

import SwiftUI

struct ModalView: View {
    
    @State private var test: String = ""
    @Environment(\.presentationMode) var presentatio
    
    var body: some View {
        Group{
            VStack{
                HStack{
                    Text("인증번호를 입력해주세요")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.leading, 30)
                
                TextField("인증번호 입력", text: $test)
                    .frame(width: 350, height: 50)
                    .textFieldStyle(.roundedBorder)
                HStack{
                    Button(action: {
                        presentatio.wrappedValue.dismiss()
                    }) {
                        Text("취소").bold()
                    }
                    .foregroundColor(.gray)
                    .frame(width: 170, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                    Button(action: {
                        // 여기에 확인하면서 인증번호랑 우리가 발생한 토큰이랑 일치한지 보면 됨.
                    }) {
                        Text("확인").bold()
                    }
                    .foregroundColor(.white)
                    .frame(width: 170, height: 50)
                    .background(Color(red: 0.603, green: 0.756, blue: 0.819))
                    .cornerRadius(10)
                }
            }
            
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
