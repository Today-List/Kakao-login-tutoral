//
//import SwiftUI
//
//struct SignUp1: View {
//    @State private var Name: String = "" // 이름
//    @State private var Nickname: String = "" // 닉네임
//    @State private var Student_id: String = "" // 학번
//    @State private var Password: String = "" // 비밀번호
//    @State private var RepeatedPassword: String = ""
//    @State private var Semester: Int = 0 // 학기
//    @State private var passwordError = ""
//    
//    
//    @State private var Graduate: Bool = false // 졸업여부
//    @State private var Department: Bool = false // 전공미선택
//    @State private var Major_minor: Bool = false // 주/부전공
//    @State private var Double_major: Bool = false // 복수전공
//    @State private var Major1: String = "IT융합자율학부" // 전공 1
//    @State private var Major2: String = "전공2" // 전공 2
//    
//    var body: some View {
//        Group{
//            VStack(){
//                TextInputView(
//                    Name: self.$Name,
//                    Nickname: self.$Nickname,
//                    Student_id: self.$Student_id,
//                    Password: self.$Password,
//                    RepeatedPassword: self.$RepeatedPassword,
//                    passwordError: self.$passwordError,
//                    Semester: self.$Semester,
//                    Graduate: self.$Graduate,
//                    Department: self.$Department,
//                    Major_minor: self.$Major_minor,
//                    Double_major: self.$Double_major,
//                    Major1: self.$Major1,
//                    Major2: self.$Major2
//                )
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
//
//struct TextInputView: View {
//    func checkEmail(str: String) -> Bool {
//        let emailRegex = "[A-Z0-9a-z._%+-]+@office.skhu.ac.kr"
//        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
//    }
//    
//    @Binding var Name: String
//    @Binding var Nickname: String
//    @Binding var Student_id: String
//    @Binding var Password: String
//    @Binding var RepeatedPassword: String
//    @Binding var passwordError: String
//    @Binding var Semester: Int
//    
//    @State var CheckMessage: String = "ex) abc123@naver.com"
//    @State var ShowModel: Bool = false
//    @State var certification: Bool = false
//    
//    
//    let SelectedMajor1 = [
//        "소프트웨어공학",
//        "정보통신공학",
//        "컴퓨터공학",
//        "인공지능"
//    ]
//    let SelectedMajor2 = [
//        "소프트웨어공학",
//        "정보통신공학",
//        "컴퓨터공학",
//        "인공지능"
//    ]
//    
//    @Binding var Graduate: Bool
//    @Binding var Department: Bool
//    @Binding var Major_minor: Bool
//    @Binding var Double_major: Bool
//    @Binding var Major1: String
//    @Binding var Major2: String
//    @State var MarjorError: String = "선택한 두 전공이 같습니다"
//    
//    struct ModalView: View {
//        @State private var test: String = ""
//        @Environment(\.presentationMode) var presentatio
//        
//        var body: some View {
//            Group{
//                VStack{
//                    HStack{
//                        Text("인증번호를 입력해주세요")
//                            .foregroundColor(.black)
//                        Spacer()
//                    }
//                    .padding(.leading, 30)
//                    
//                    TextField("인증번호 입력", text: $test)
//                        .frame(width: 350, height: 50)
//                        .textFieldStyle(.roundedBorder)
//                    HStack{
//                        Button(action: {
//                            presentatio.wrappedValue.dismiss()
//                        }) {
//                            Text("취소").bold()
//                        }
//                        .foregroundColor(.gray)
//                        .frame(width: 170, height: 50)
//                        .background(Color(uiColor: .secondarySystemBackground))
//                        .cornerRadius(10)
//                        Button(action: {
//                            // 여기에 확인하면서 인증번호랑 우리가 발생한 토큰이랑 일치한지 보면 됨.
//                        }) {
//                            Text("확인").bold()
//                        }
//                        .foregroundColor(.white)
//                        .frame(width: 170, height: 50)
//                        .background(Color(red: 0.603, green: 0.756, blue: 0.819))
//                        .cornerRadius(10)
//                    }
//                }
//                
//            }
//        }
//    }
//    
//    var body: some View {
//        ScrollView{
//            Spacer()
//                .padding(30)
//            HStack{
//                TextField("닉네임을 입력해주세요* ", text: $Nickname)
//                    .padding()
//                    .frame(width: 250, height: 50)
//                    .background(Color(uiColor: .secondarySystemBackground))
//                    .cornerRadius(10)
//                Button{} label: {
//                    Text("중복확인")
//                        .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
//                        .frame(width: 90, height:50)
//                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
//                }
//            } // 닉네임 입력 HStack
//            .padding(30)
//            .padding(.bottom, -15)
//            VStack{
//                HStack{
//                    TextField("이메일을 입력해주세요* ", text: $Student_id)
//                        .padding()
//                        .frame(width: 250, height: 50)
//                        .background(Color(uiColor: .secondarySystemBackground))
//                        .cornerRadius(10)
//                        .keyboardType(.decimalPad)
//                    Button{
//                        if checkEmail(str: Student_id){
//                            CheckMessage = ""
//                            self.ShowModel = true
//                        }
//                        else{
//                            CheckMessage = "이메일 형식이 올바르지 않습니다."
//                        }
//                    } label: {
//                        Text("인증번호 발송")
//                            .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
//                            .frame(width: 90, height:50)
//                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
//                            .sheet(isPresented: self.$ShowModel) {
//                                ModalView()
//                            }
//                        
//                    }
//                }
//                HStack{
//                    Text("\(CheckMessage)")
//                        .padding(.leading, 30)
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                        .lineLimit(2)
//                    Spacer()
//                }
//                
//            }
//            .padding(.bottom, 16)// 학번 중복확인 HStack
//            VStack(spacing: 15){ // 비밀번호 입력 받는 SecureField
//                SecureField("비밀번호를 입력해주세요 *", text: $Password)
//                    .padding()
//                    .frame(width: 350, height: 50)
//                    .background(Color(uiColor: .secondarySystemBackground))
//                    .cornerRadius(10)
//                    .onChange(of: Password) { V in
//                        if (Password == RepeatedPassword) {
//                            passwordError = ""
//                        }
//                        else {
//                            passwordError = "비밀번호가 일치하지 않습니다."
//                        }
//                    }
//                    .padding(.bottom, 10)// 학번 중복확인 HStack
//                
//                VStack(spacing: 5){ // 비밀번호 입력 확인 안내문구와 SecureField
//                    SecureField("비밀번호를 한번 더 입력해주세요*", text: $RepeatedPassword)
//                        .padding()
//                        .frame(width: 350, height: 50)
//                        .background(Color(uiColor: .secondarySystemBackground))
//                        .cornerRadius(10)
//                        .onChange(of: RepeatedPassword) { V in
//                            if (Password == RepeatedPassword) {
//                                passwordError = ""
//                            }
//                            else {
//                                passwordError = "비밀번호가 일치하지 않습니다."
//                            }
//                        }
//                    HStack{ // 비밀번호 안내문구 출력
//                        Text(passwordError)
//                            .padding(.leading, 30)
//                            .font(.system(size: 14))
//                            .foregroundColor(.red)
//                        Spacer() // 문구 왼쪽 정렬을 위함
//                    }
//                } // 비밀번호 입력 확인 Field
//            } // 비밀번호 입력 받는 Field
//            .padding(.bottom)
//            Text("회원가입")
//                .frame(width: 330, height: 10)
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .background(Color(hex: 0x87CEFA))
//                .cornerRadius(10)
//        }//VStack 종료 부분
//        .padding([.leading, .trailing], 30)
//    }
//}
//
//
//
//struct Signup1_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp1()
//    }
//}
