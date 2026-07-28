import SwiftUI

struct AboutView: View {
    @AppStorage("haptics") private var haptics = true
    @AppStorage("analytics") private var analytics = false

    private var version: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }

    var body: some View {
        Form {
            Section {
                Toggle("Haptic feedback", isOn: $haptics)
                Toggle("Share usage analytics", isOn: $analytics)
            }
            Section {
                LabeledContent("Version", value: version)
                LabeledContent("Framework", value: "SwiftUI")
                LabeledContent("Minimum", value: "iOS 17")
            }
        }
        .navigationTitle("About")
    }
}

#Preview {
    NavigationStack { AboutView() }.preferredColorScheme(.dark)
}
