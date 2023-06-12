import SwiftUI

struct CalenderView1: View {
    @State private var eventData: [Date: String] = [:]
    @State private var isPresentingModal = false
    @State private var selectedDate = Date()
    @EnvironmentObject var todoLists: TodoLists
    
    var body: some View {
        VStack {
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding()
                .accentColor(Color(hex: 0xF193B8A))
            VStack{
                HeaderView()
                TextFieldView4()
                TodoListView5()
                    .frame(width:300, height: 80)
                SaveLoadButtonView6()

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: 0xF193B8A), lineWidth: 2)
                    .background(Color.white)
            )
        }
    }
}

struct CalenderView1_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView1().environmentObject(TodoLists())
    }
}
