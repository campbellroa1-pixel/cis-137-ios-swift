import Foundation

// MODEL: Stores information about each flower card.
struct FlowerCard: Identifiable {

    let id = UUID()

    let flowerNumber: Int

    var isFaceUp = false

    var isMatched = false
}

