
import SwiftUI

extension Color {
    static let whiteTheme = Color(hex: 0xFFFFFF)
    static let greenTheme = Color(hex: 0x02343F)
    static let blueTheme = Color(hex: 0x6A7BA2)
    static let pinkTheme = Color(hex: 0xFBEAEB)
    static let brownTheme = Color(hex: 0x755139)
    static let baseTheme = Color(hex: 0x193B8A)
    
    // 16진수를 기반으로 Color 생성
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    var name: String {
        switch self {
        case .whiteTheme: return "White"
        case .greenTheme: return "Green"
        case .blueTheme: return "Blue"
        case .pinkTheme: return "Pink"
        case .brownTheme: return "Brown"
        default: return "Unknown"
        }
    }
}
