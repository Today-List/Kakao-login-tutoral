import Charts
import SwiftUI

struct Posting: Identifiable {
    let name: String
    let count: Int
    
    var id: String { name }
}

let postings: [Posting] = [
    .init(name: "월", count: 10),
    .init(name: "화", count: 6),
    .init(name: "수", count: 7),
    .init(name: "목", count: 5),
    .init(name: "금", count: 2),
    .init(name: "토", count: 3),
    .init(name: "일", count: 8)
]

// 차트 그리기
struct BarChartView: View {
    var body: some View {
        VStack{
            Text("이번달 달성율")
                .font(.title2.bold())
                .padding()
                .padding(.top, 30)
            HStack {
                Button(action: {
                    //친구추가
                },
                    label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 280)
                        .foregroundColor(Color(hex: 0x193B8A)) // 이미지 색상 설정
                       
                })
            }
            Chart {
                ForEach(postings) { posting in
                    BarMark(
                        x: .value("Name", posting.name),
                        y: .value("Posting", posting.count)
                    )}
                .cornerRadius(10)
            }
            .padding([.top, .bottom], 100)
            .foregroundColor(Color(hex: 0xFF9967))
            
        }
    }
}
