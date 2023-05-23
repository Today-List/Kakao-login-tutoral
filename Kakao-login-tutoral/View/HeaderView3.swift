import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("오늘의 계획은 무엇인가요?")
                .font(.title3)
                .padding([.trailing, .leading])
                .padding(.leading)
            Button(action: {
                
            }, label: {
                
                Image(systemName: "location")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(Color(hex: 0xF193B8A))

                
            })
            
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
