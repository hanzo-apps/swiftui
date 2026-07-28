import SwiftUI

@main
struct HanzoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    var body: some View {
        TabView {
            NavigationStack { FeedView() }
                .tabItem { Label("Feed", systemImage: "square.grid.2x2") }
            NavigationStack { SearchView() }
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            NavigationStack { AboutView() }
                .tabItem { Label("About", systemImage: "info.circle") }
        }
        .tint(.hanzo)
        .preferredColorScheme(.dark)
    }
}

extension Color {
    /// One accent for the whole app. Views never hard-code a hex.
    static let hanzo = Color(red: 0.486, green: 0.361, blue: 1.0)
}
