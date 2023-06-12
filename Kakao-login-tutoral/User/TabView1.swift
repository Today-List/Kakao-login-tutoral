import SwiftUI

struct TabView1: View {
    
    @State private var selection = 1
//    @StateObject private var tabViewModel = TabViewModel()
    @State private var selectedColor = Color.baseTheme
    
    
//    init() {
//            UITabBar.appearance().unselectedItemTintColor = UIColor.white
//    }
    
    var body: some View {
        TabView(selection: $selection) {
            Group {
                CalenderView1()
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                            .renderingMode(.original)
//                            .foregroundColor(.gray)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .tag(1)
                
                BarChartView()
                    .tabItem {
                        Image(systemName: "calendar")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .tag(2)
                
                SettingView1()
                    .tabItem {
                        Image(systemName: "gearshape")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .tag(3)
            }
        }
        .accentColor(.whiteTheme)
        .navigationBarHidden(true) // 내비게이션 바를 숨깁니다.
        .onAppear { // 뷰가 나타날 때 실행되는 클로저를 정의합니다.
            UITabBar.appearance().backgroundColor = UIColor(selectedColor) // 탭 바의 배경색을 tabViewModel.tabBarColor에 설정된 색상으로 변경합니다.
            UITabBar.appearance().barTintColor = .white
        }
//        .background(tabViewModel.tabBarColor.edgesIgnoringSafeArea(.all)) // 배경에 tabViewModel.tabBarColor에 설정된 색상을 사용하고, safe area를 무시하도록 설정합니다.
    }
}
class TabViewModel: ObservableObject {
    
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
