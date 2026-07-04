import SwiftUI

enum AppTheme {
    static let background = Color(red: 0.95, green: 0.96, blue: 0.98)
    static let cardBackground = Color.white
    static let ink = Color(red: 0.08, green: 0.11, blue: 0.18)
    static let muted = Color(red: 0.39, green: 0.45, blue: 0.55)
    static let primary = Color(red: 0.10, green: 0.42, blue: 0.92)
    static let primaryDark = Color(red: 0.05, green: 0.18, blue: 0.42)
    static let success = Color(red: 0.05, green: 0.58, blue: 0.34)
    static let warning = Color(red: 0.95, green: 0.55, blue: 0.14)
    static let danger = Color(red: 0.87, green: 0.20, blue: 0.25)
    static let purple = Color(red: 0.48, green: 0.31, blue: 0.92)

    static let cardRadius: CGFloat = 26
    static let smallRadius: CGFloat = 18
}

struct AppCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(AppTheme.cardBackground, in: RoundedRectangle(cornerRadius: AppTheme.cardRadius, style: .continuous))
            .shadow(color: .black.opacity(0.06), radius: 18, x: 0, y: 10)
    }
}

extension View {
    func appCard() -> some View {
        modifier(AppCardModifier())
    }
}
