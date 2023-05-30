//import SwiftUI
//
//struct ColorSchemeView1: View {
//    @Environment(\.colorScheme) var currentColorScheme
//    @State private var selectedColor: ColorSchemeEnum = .light
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                selectedColor = .light
//            }, label: {
//                Text("Light mode")
//                    .foregroundColor(.black)
//                    .padding()
//                    .background(Color.white)
//            })
//
//            Button(action: {
//                selectedColor = .dark
//            }, label: {
//                Text("Black Mode")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.black)
//            })
//            
//            Text("현재 선택된 색상: \(String(describing: selectedColor)) 입니다.")
//        }
//        .onAppear {
//            // 앱이 처음 시작할 때, 시스템 설정에서 선택한 UI 스타일로 설정
//            selectedColor = currentColorScheme == .dark ? .dark : .light
//        }
//        .onChange(of: selectedColor) { _ in
//            // 색상 선택이 변경될 때, 선택된 색상에 따라 UI 스타일을 변경
//            if selectedColor == .dark {
//                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
//            } else if selectedColor == .light {
//                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
//            } else {
//                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
//            }
//        }
//    }
//
//    // 색상 선택을 나타내는 열거형
//    enum ColorSchemeEnum {
//        case dark, light, green, blue
//    }
//}
