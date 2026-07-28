import Testing
@testable import HanzoSwiftUI

/// swift-testing, not XCTest: the filter lives on the model precisely so it can
/// be exercised without a host app or a simulator UI test.
@Suite struct ItemTests {
    @Test func emptyQueryReturnsEverything() {
        #expect(Item.matching("").count == Item.all.count)
        #expect(Item.matching("   ").count == Item.all.count)
    }

    @Test func matchesTitleBlurbAndTag() {
        #expect(Item.matching("observation").map(\.id) == ["observation"])
        #expect(Item.matching("SWIFTUI").map(\.id) == ["declarative"])
        #expect(Item.matching("cancels itself").map(\.id) == ["concurrency"])
    }

    @Test func missIsEmptyNotACrash() {
        #expect(Item.matching("kotlin").isEmpty)
    }

    @Test func idsAreUnique() {
        #expect(Set(Item.all.map(\.id)).count == Item.all.count)
    }
}
