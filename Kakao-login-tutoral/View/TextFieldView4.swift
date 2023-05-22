import SwiftUI

struct TextFieldView4: View {

    @State var toDoString: String = ""
    @EnvironmentObject var todoLists : TodoLists
    @State private var showAlert = false

    var body: some View {
        HStack {
            Image(systemName: "square.and.pencil")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28)
                .foregroundColor(Color(hex: 0xF193B8A))
            TextField(
                "오늘의 일정",
                text: $toDoString

            )
            .foregroundColor(.gray)
            .padding()
            .frame(height: 30)
            .background(Color(uiColor: .secondarySystemBackground))

            Button(action: {
                if toDoString == "" {
                    showAlert = true

                } else {
                    appendList()
                    toDoString = ""
                }
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(Color(hex: 0xF193B8A))
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("❗️알림❗️"), message: Text("오늘의 계획을 입력해주세요."), dismissButton: .default(Text("OK")))
            }
        }
        .textFieldStyle(DefaultTextFieldStyle())
        .frame(width: 300, height: 50, alignment: .center)
    }

    func appendList() {
        let inputList = TodoList(content: toDoString, checked: false)
        todoLists.list.append(inputList)
    }
}

