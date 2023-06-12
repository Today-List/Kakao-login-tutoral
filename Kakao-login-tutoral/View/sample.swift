//import SwiftUI
//import FSCalendar
//
//struct FSCalendarView: UIViewRepresentable {
//    @Binding var selectedDate: Date?
//    @Binding var eventData: [Date: String]
//    @Binding var isPresentingModal: Bool
//
//    func makeUIView(context: Context) -> FSCalendar {
//        let calendar = FSCalendar()
//        calendar.delegate = context.coordinator
//        calendar.dataSource = context.coordinator
//        calendar.appearance.headerMinimumDissolvedAlpha = 0
//        calendar.appearance.caseOptions = .weekdayUsesSingleUpperCase
//        calendar.scrollDirection = .horizontal
//        calendar.scope = .month
//        return calendar
//    }
//
//    func updateUIView(_ uiView: FSCalendar, context: Context) {
//        uiView.reloadData()
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
//        var parent: FSCalendarView
//
//        init(_ parent: FSCalendarView) {
//            self.parent = parent
//        }
//
//        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//            if let _ = parent.eventData[date] {
//                return 1
//            }
//            return 0
//        }
//
//        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
//            if let _ = parent.eventData[date] {
//                return [UIColor.red]
//            }
//            return nil
//        }
//
//        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//            parent.selectedDate = date
//            parent.isPresentingModal = true
//        }
//    }
//}
//
//struct AddEventView: View {
//    @Binding var eventData: [Date: String]
//    @Binding var isPresentingModal: Bool
//    @State private var inputText: String = ""
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Event Description", text: $inputText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Spacer()
//            }
//            .padding()
//            .navigationBarTitle("Add Event", displayMode: .inline)
//            .navigationBarItems(trailing: Button("Done") {
//                eventData.updateValue(inputText, forKey: Date())
//                isPresentingModal = false
//            })
//        }
//    }
//}
