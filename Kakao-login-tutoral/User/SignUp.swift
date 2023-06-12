//
//  SignUp.swift
//  Kakao-login-tutoral
//
//  Created by 봉주헌 on 2023/05/23.
//

import SwiftUI

struct SignUp: View {
    
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@office.skhu.ac.kr"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    @State private var Name: String = "" // 이름
    @State private var Nickname: String = "" // 닉네임
    @State private var Email: String = "" // 학번
    @State private var Password: String = "" // 비밀번호
    @State private var RepeatedPassword: String = ""
    @State private var Semester: Int = 0 // 학기
    @State private var passwordError = ""
    @State var CheckMessage: String = "ex) abc123@naver.com"
    @State var ShowModel: Bool = false
    @State var certification: Bool = false
    
    @Environment(\.presentationMode) var presentatio
    
    func sendSignUpRequest() {
            guard let url = URL(string: "http://todorack.netlify.app/users/new-user") else {
                print("Invalid URL")
                return
            }
            let parameters = [
                "Nickname": Nickname,
                "Email": Email,
                "Password": Password
                // Add other parameters if needed
            ]

            guard let postData = try? JSONSerialization.data(withJSONObject: parameters) else {
                print("Failed to serialize parameters")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = postData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                // Handle the response from the server if needed
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("Response: \(jsonString)")
                    }
                }
            }.resume()
        }
    
    var body: some View {
        NavigationView{
            ScrollView{
                Spacer()
                    .padding(30)
                HStack{
                    TextField("닉네임을 입력해주세요* ", text: $Nickname)
                        .padding()
                        .frame(width: 230, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(50)
                    Button{} label: {
                        Text("중복확인")
                            .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
                            .frame(width: 90, height:50)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
                    }
                } // 닉네임 입력 HStack
                .padding(30)
                .padding(.bottom, -15)
                VStack{
                    HStack{
                        TextField("이메일을 입력해주세요* ", text: $Email)
                            .padding()
                            .frame(width: 230, height: 50)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(50)
                            .keyboardType(.decimalPad)
                        Button{
                            if checkEmail(str: Email){
                                CheckMessage = ""
                                self.ShowModel = true
                            }
                            else{
                                CheckMessage = "이메일 형식이 올바르지 않습니다."
                            }
                        } label: {
                            Text("인증번호 발송")
                                .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
                                .frame(width: 90, height:50)
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
                                .sheet(isPresented: self.$ShowModel) {
                                    ModalView()
                                }
                            
                        }
                    }
                    HStack{
                        Text("\(CheckMessage)")
                            .padding(.leading, 50)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .lineLimit(2)
                        Spacer()
                    }
                    
                }
                .padding(.bottom, 16)// 학번 중복확인 HStack
                VStack(spacing: 15){ // 비밀번호 입력 받는 SecureField
                    SecureField("비밀번호를 입력해주세요 *", text: $Password)
                        .padding()
                        .frame(width: 330, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(50)
                        .onChange(of: Password) { V in
                            if (Password == RepeatedPassword) {
                                passwordError = ""
                            }
                            else {
                                passwordError = "비밀번호가 일치하지 않습니다."
                            }
                        }
                        .padding(.bottom, 10)// 학번 중복확인 HStack
                    
                    VStack(spacing: 5){ // 비밀번호 입력 확인 안내문구와 SecureField
                        SecureField("비밀번호를 한번 더 입력해주세요*", text: $RepeatedPassword)
                            .padding()
                            .frame(width: 330, height: 50)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(50)
                            .onChange(of: RepeatedPassword) { V in
                                if (Password == RepeatedPassword) {
                                    passwordError = ""
                                }
                                else {
                                    passwordError = "비밀번호가 일치하지 않습니다."
                                }
                            }
                        HStack{ // 비밀번호 안내문구 출력
                            Text(passwordError)
                                .padding(.leading, 30)
                                .font(.system(size: 14))
                                .foregroundColor(.red)
                            Spacer() // 문구 왼쪽 정렬을 위함
                        }
                    } // 비밀번호 입력 확인 Field
                } // 비밀번호 입력 받는 Field
                .padding(.bottom)
                
                Button(action: {
                    presentatio.wrappedValue.dismiss()
                    sendSignUpRequest()
                }, label: {
                    Text("회원가입")
                        .frame(width: 290, height: 10)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: 0xF193B8A))
                        .cornerRadius(50)
                })
                
            }//VStack 종료 부분
            .padding([.leading, .trailing], 30)
        }}
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
