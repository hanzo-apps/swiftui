import SwiftUI

struct FeedView: View {
    var body: some View {
        List(Item.all) { item in
            NavigationLink(value: item) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.tag.uppercased())
                        .font(.caption2.weight(.bold))
                        .kerning(1)
                        .foregroundStyle(Color.hanzo)
                    Text(item.title).font(.headline)
                    Text(item.blurb)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Hanzo")
        .navigationDestination(for: Item.self) { DetailView(item: $0) }
    }
}

struct DetailView: View {
    let item: Item

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(item.tag.uppercased())
                    .font(.caption2.weight(.bold))
                    .kerning(1)
                    .foregroundStyle(Color.hanzo)
                Text(item.title).font(.largeTitle.bold())
                Text(item.body)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { FeedView() }.preferredColorScheme(.dark)
}
