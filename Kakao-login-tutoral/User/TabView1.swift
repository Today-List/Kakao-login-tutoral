import SwiftUI

struct TabView1: View {
    
    @State private var selection = 1
//    @StateObject private var tabViewModel = TabViewModel()
    @State var selectionColor: Color? = .baseTheme

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
        .accentColor(.white) // 뷰의 강조 색상을 흰색으로 설정합니다.
        .navigationBarHidden(true) // 내비게이션 바를 숨깁니다.
        .onAppear { // 뷰가 나타날 때 실행되는 클로저를 정의합니다.
            UITabBar.appearance().backgroundColor = UIColor(selectionColor!) // 탭 바의 배경색을 tabViewModel.tabBarColor에 설정된 색상으로 변경합니다.
            UITabBar.appearance().barTintColor = .gray
        }
//        .background(tabViewModel.tabBarColor.edgesIgnoringSafeArea(.all)) // 배경에 tabViewModel.tabBarColor에 설정된 색상을 사용하고, safe area를 무시하도록 설정합니다.
    }
}
