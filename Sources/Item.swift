import Foundation

/// Local seed data. Swap `Item.all` for a URLSession call against your own /v1
/// API — the views only depend on the Item shape, not on where it came from.
struct Item: Identifiable, Hashable, Sendable {
    let id: String
    let title: String
    let tag: String
    let blurb: String
    let body: String

    static let all: [Item] = [
        Item(id: "declarative",
             title: "The view is a function of state",
             tag: "swiftui",
             blurb: "You never mutate a view; you change state and it is recomputed.",
             body: "A SwiftUI view is a lightweight value type, recreated on every state change and diffed against the previous tree. That is why `body` must be cheap and free of side effects — it runs far more often than a UIKit `viewDidLoad` ever did."),
        Item(id: "observation",
             title: "@Observable over ObservableObject",
             tag: "observation",
             blurb: "Swift 5.9's macro tracks the properties a view actually read.",
             body: "ObservableObject invalidated every observer on any @Published change. @Observable records per-property reads during body evaluation, so a view that reads only `title` does not redraw when `count` changes. Fewer invalidations, no @Published bookkeeping."),
        Item(id: "concurrency",
             title: "Structured concurrency, checked at compile time",
             tag: "swift 6",
             blurb: "`.task {}` cancels itself when the view goes away.",
             body: "Strict concurrency checking makes data races a compile error rather than a crash report. A `.task` modifier ties an async job to the view's lifetime, so navigating away cancels the request instead of leaking it."),
        Item(id: "toolchain",
             title: "Native means the Apple toolchain",
             tag: "xcode",
             blurb: "No JS runtime, no renderer of our own — and no Linux build.",
             body: "SwiftUI is a closed-source Apple framework that exists only in the iOS/macOS SDKs. Nothing about this target can be compiled on a Linux runner, which is exactly why the CI in this repo is split the way it is. See the README."),
    ]
}
