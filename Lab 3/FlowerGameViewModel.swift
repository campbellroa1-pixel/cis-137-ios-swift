import Foundation
import SwiftUI

// VIEWMODEL: Controls the memory game.
class FlowerGameViewModel: ObservableObject {

    @Published var cards: [FlowerCard] = []

    @Published var moves = 0

    @Published var matchedPairs = 0

    private var selectedCards: [Int] = []

    init() {
        restartGame()
    }

    // Creates the flower cards.
    func restartGame() {

        cards = []

        moves = 0

        matchedPairs = 0

        selectedCards = []

        for number in 1...12 {

            cards.append(FlowerCard(flowerNumber: number))

            cards.append(FlowerCard(flowerNumber: number))
        }

        cards.shuffle()
    }

    // Handles a card being tapped.
    func chooseCard(at index: Int) {

        guard index >= 0 && index < cards.count else {
            return
        }

        // Don't allow matched cards to be selected.
        if cards[index].isMatched {
            return
        }

        // Don't allow the same card to be selected twice.
        if cards[index].isFaceUp {
            return
        }

        // Don't allow another selection while checking two cards.
        if selectedCards.count == 2 {
            return
        }

        withAnimation(.easeInOut(duration: 0.3)) {
            cards[index].isFaceUp = true
        }

        selectedCards.append(index)

        // Check for a match after two cards are selected.
        if selectedCards.count == 2 {

            moves += 1

            checkForMatch()
        }
    }

    // Checks whether the two cards match.
    private func checkForMatch() {

        let firstIndex = selectedCards[0]

        let secondIndex = selectedCards[1]

        if cards[firstIndex].flowerNumber ==
            cards[secondIndex].flowerNumber {

            withAnimation(.easeInOut(duration: 0.3)) {

                cards[firstIndex].isMatched = true

                cards[secondIndex].isMatched = true
            }

            matchedPairs += 1

            selectedCards = []

        } else {

            // Turn both cards back over after a short delay.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

                withAnimation(.easeInOut(duration: 0.3)) {

                    self.cards[firstIndex].isFaceUp = false

                    self.cards[secondIndex].isFaceUp = false
                }

                self.selectedCards = []
            }
        }
    }
}

