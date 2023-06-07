import SwiftUI

struct ColorSelectionView: View {
    @Binding var selectedColor: Color?
    let themes: [Color]
    @Binding var isPresented: Bool
    @State private var selectedColorName: String? // 선택된 색상의 이름을 저장하기 위한 상태 변수
    
    @Binding var selectionColor: Color
    
    var body: some View {
        VStack {
            HStack {
                ForEach(themes, id: \.self) { color in
                    Button(action: {
                        selectedColor = color
                        selectionColor = selectedColor!
                        selectedColorName = color.name // 선택된 색상의 이름 저장
                    }) {
                        color
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: 0xF193B8A), lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
            
            Button(action: {
                // 저장하기 버튼에 대한 액션을 추가해주세요
                
                // 저장 완료 후 해당 뷰를 닫기 위해 isPresented를 false로 설정합니다.
                isPresented = false
                print("선택된 색상은: \(selectedColorName!)")
            }) {
                Text("저장하기")
                    .frame(width: 120, height: 40)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            if let selectedColorName = selectedColorName {
                Text("선택된 색상: \(selectedColorName)")
                    .padding(.top)
            }
        }
        .background(Color.white)
    }
}


class TabViewModel: ObservableObject {
    init() {
        setTabBarAppearance()
    }
    
    private func setTabBarAppearance() {
        // UITabBarAppearance 인스턴스 생성
        let tabBarAppearance = UITabBarAppearance()
        
        // 탭 바 배경색 설정
        tabBarAppearance.backgroundColor = UIColor(Color(hex: 0x193B8A))
        
        // 스택 레이아웃의 일반 상태에서 아이콘 색상 설정
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        
        // 스택 레이아웃의 선택된 상태에서 아이콘 색상 설정
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        
        // 일반적인 탭 바 외관에 tabBarAppearance 설정
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        // 스크롤 가장자리 탭 바 외관에 tabBarAppearance 설정
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    @Published var tabBarColor: Color = Color(hex: 0x193B8A)
}


struct SettingView1: View {
       @State private var isColorSelectionViewPresented = false
       @State private var backgroundColor: Color? = .white
       @State private var selectedColor: Color?
       @State private var notificationsEnabled = false
       @State private var themeIndex = 0

       let themes: [Color] = [Color.whiteTheme, Color.greenTheme, Color.blueTheme, Color.pinkTheme, Color.brownTheme]

       let notificationCenter = UNUserNotificationCenter.current()

       private func toggleUserNotification() {
           notificationsEnabled.toggle()
           if notificationsEnabled {
               notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                   if let error = error {
                       print(error)
                   } else {
                       if !granted {
                           print("Not Granted")
                       }
                   }
               }
           }
       }

       @StateObject private var tabViewModel = TabViewModel()

       init() {
           _tabViewModel = StateObject(wrappedValue: TabViewModel())
       }

       @Environment(\.colorScheme) var colorScheme
       @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Form {
                Section(header: Text("설정").font(.title)) {
                    Button(action: {
                        isColorSelectionViewPresented = true
                    }) {
                        Text("테마 변경")
                    }
                    
                    Toggle(isOn: $notificationsEnabled, label: {
                        Text("알림 허용")
                    })
                    .onAppear() {
                        self.notificationCenter.getNotificationSettings { settings in
                            notificationsEnabled = settings.authorizationStatus == .authorized
                        }
                    }
                    
                    NavigationLink(
                        destination: authView1(),
                        label: {
                            Text("계정관리")
                        })
                }
                .padding(.vertical, 5)
                .accentColor(tabBarColor())
            }
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .onAppear {
            updateTheme()
        }
        .sheet(isPresented: $isColorSelectionViewPresented) {
            ColorSelectionView(selectedColor: $backgroundColor, themes: themes, isPresented: $isColorSelectionViewPresented, selectionColor: Binding.constant(Color.white))
                        .onDisappear {
                            if let selectedColor = selectedColor {
                                backgroundColor = selectedColor
                            }
                        }
                }
    }
    
    func tabBarColor() -> Color {
        return Color.primary
    }
    
    func updateTheme() {
        switch colorScheme {
        case .light:
            themeIndex = 0
        case .dark:
            themeIndex = 1
        @unknown default:
            themeIndex = 0
        }
    }
}


