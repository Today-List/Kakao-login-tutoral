import SwiftUI

struct TabView1: View {
    
    @State private var selection = 1
    @StateObject private var tabViewModel = TabViewModel()


    var body: some View {
        TabView(selection: $selection) {
            Group {
                CalenderView1()
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                            .renderingMode(.original)
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
        .accentColor(.white)
                .navigationBarHidden(true)
                .onAppear {
                    UITabBar.appearance().backgroundColor = UIColor(tabViewModel.tabBarColor)
                }
                .background(tabViewModel.tabBarColor.edgesIgnoringSafeArea(.all))
    }
}
