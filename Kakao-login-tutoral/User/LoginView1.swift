//
//  LoginView.swift
//  CJB
//
//  Created by 봉주헌 on 2023/03/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser



struct LoginView1: View {
    @State var FirstView = false
    @State private var User_id: String = ""
    @State private var User_password: String = ""
    
    func sendLoginRequest() {
            guard let url = URL(string: "http://todorack.netlify.app/users/login") else {
                print("Invalid URL")
                return
            }

            let parameters = [
                "User_id": User_id,
                "User_password": User_password
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
            ZStack{
                Color(hex: 0xF193B8A).ignoresSafeArea()
                
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(.bottom)
                    TextField("로그인", text: $User_id)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(50)
                    SecureField("비밀번호", text: $User_password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(50)
                        .padding(.top, 5)
                    NavigationLink(
                        destination: TabView1(),
                        label: {
                            Text("로그인")
                                .frame(width: 260, height: 10)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex: 0x7DA4FF))
                                .cornerRadius(50)
                        })
                    .onTapGesture {
                                    sendLoginRequest()
                                }
                    .padding([.top, .bottom], 5)
                    VStack{
                        HStack{
                            Button {
                                if (UserApi.isKakaoTalkLoginAvailable()) {
                                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                                        print(oauthToken)
                                        print(error)
                                    }
                                } else {
                                    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                                        print(oauthToken)
                                        print(error)
                                    }
                                }
                            }  label: {
                                Image("kakaoLogin")
                                    .frame(width: 260, height: 10)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: 0x87CEFA))
                                    .cornerRadius(50)
                            }
                        }
                        .padding([.top, .bottom], 5)
                        NavigationLink(destination: SignUp(),
                                       label: {
                            Text("회원가입")
                                .font(.system(size: 15))
                                .frame(width: 70, height: 0)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.leading ,200)
                        })
                    }
                }
            }
            .onAppear {
                if !UserApi.isKakaoTalkLoginAvailable() {
                    UserApi.shared.loginWithKakaoAccount { [self] (oauthToken, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            // 로그인 성공
                            guard let token = oauthToken?.accessToken else { return }
                            print(token)
                        }
                    }
                }

            }
        }
    }
}
struct LoginView1_Previews: PreviewProvider {
    static var previews: some View {
        LoginView1()
    }
}
