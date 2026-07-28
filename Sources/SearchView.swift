import SwiftUI

struct SearchView: View {
    @State private var query = ""

    /// Pure function of state — no cached array to keep in sync.
    private var hits: [Item] {
        Item.matching(query)
    }

    var body: some View {
        List(hits) { item in
            NavigationLink(value: item) {
                HStack {
                    Text(item.title)
                    Spacer()
                    Text(item.tag).font(.caption).foregroundStyle(.secondary)
                }
            }
        }
        .overlay {
            if hits.isEmpty {
                ContentUnavailableView.search(text: query)
            }
        }
        .searchable(text: $query, prompt: "Search")
        .navigationTitle("Search")
        .navigationDestination(for: Item.self) { DetailView(item: $0) }
    }
}

extension Item {
    /// Kept next to the model, not in the view, so the test can exercise the
    /// filter without standing up a UI.
    static func matching(_ query: String) -> [Item] {
        let needle = query.trimmingCharacters(in: .whitespaces).lowercased()
        guard !needle.isEmpty else { return all }
        return all.filter { "\($0.title)\($0.blurb)\($0.tag)".lowercased().contains(needle) }
    }
}

#Preview {
    NavigationStack { SearchView() }.preferredColorScheme(.dark)
}
