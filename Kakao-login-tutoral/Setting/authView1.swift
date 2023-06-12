import SwiftUI

struct authView1: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State var isEditingModalPresented: Bool = false
    @State private var showingPasswordChangeView = false
    

    func logout() {
        guard let url = URL(string: "http://localhost:8088/user/logout") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Logout error:", error)
            } else if let response = response as? HTTPURLResponse {
                print("Logout response status code:", response.statusCode)
                
                // Perform additional logic after successful logout
            }
        }.resume()
        
        // Perform any necessary cleanup or navigation to the login screen
    }

    var body: some View {
        VStack {
            Text("봉주헌 님")
                .font(.title2)
                .padding([.top, .bottom])
            Text("ipo5069@naver.com")
                .font(.caption)
            Form {
                Button(action: {
                    isEditingModalPresented = true
                }) {
                    Text("정보 수정하기")
                }
                .sheet(isPresented: $isEditingModalPresented) {
                    editProView()
                }
                Button(action: {
                    showingPasswordChangeView.toggle()
                }) {
                    Text("암호 수정하기")
                }
                .sheet(isPresented: $showingPasswordChangeView) {
                    PasswordChangeView()
                }
                Button(action: {
                    logout()
                }) {
                    Text("로그아웃")
                }
            }
        }
    }
}

struct authView1_Previews: PreviewProvider {
    static var previews: some View {
        authView1()
    }
}
