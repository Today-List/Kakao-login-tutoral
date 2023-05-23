

import SwiftUI

struct SettingView1: View {
    
    @State private var notificationsEnabled = false
    
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
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Form{
                Section(header: Text("설정").font(.title)) {
                    NavigationLink(
                        destination: ColorSchemeView1(),
                        label: {
                            Text("테마변경")
                        })
                
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
                    
                }.padding(.vertical, 5)
                
            }
        }
    }
}

struct SettingView1_Previews: PreviewProvider {
    static var previews: some View {
        SettingView1()
    }
}
