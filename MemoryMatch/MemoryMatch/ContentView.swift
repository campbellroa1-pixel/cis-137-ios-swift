
// Lab #2: Memory Game
// Full Name: Antonio Campbell-Rodriguez
// Date: October 19, 2026

import SwiftUI

// Represents one card in the memory game.
struct MemoryCard: Identifiable, Equatable {
    let id = UUID()
    let emoji: String

    // Creates six pairs and shuffles them.
    static func makeDeck() -> [MemoryCard] {
        let emojis = ["🐶", "🐱", "🌸", "🌻", "🍎", "🚀"]

        let cards = emojis + emojis
        return cards.map { MemoryCard(emoji: $0) }.shuffled()
    }
}

struct ContentView: View {

    @State private var cards = MemoryCard.makeDeck()
    @State private var selectedCards: [UUID] = []
    @State private var matchedCards: Set<UUID> = []
    @State private var isChecking = false
    @State private var moves = 0

    var body: some View {
        ZStack {
            Color(red: 0.10, green: 0.14, blue: 0.28)
                .ignoresSafeArea()

            VStack(spacing: 20) {

                // Game title and instructions.
                Text("🧠 Memory Match")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)

                Text("Find all 6 matching pairs!")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))

                // Displays the player's progress.
                HStack {
                    Text("Moves: \(moves)")
                    Spacer()
                    Text("Pairs: \(matchedCards.count / 2) / 6")
                }
                .font(.headline)
                .foregroundColor(.white)

                // Displays twelve cards in three columns.
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 10),
                        GridItem(.flexible(), spacing: 10),
                        GridItem(.flexible(), spacing: 10)
                    ],
                    spacing: 10
                ) {
                    ForEach(cards) { card in
                        cardView(for: card)
                    }
                }

                // Shows a message when the game is complete.
                if matchedCards.count == cards.count {
                    Text("🎉 You found every pair!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                }

                // Starts a new game.
                Button(action: restartGame) {
                    Text("New Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }

                Spacer(minLength: 0)
            }
            .padding()
        }
    }

    // Builds the front or back of an individual card.
    private func cardView(for card: MemoryCard) -> some View {
        let isFaceUp = selectedCards.contains(card.id)
            || matchedCards.contains(card.id)

        return Button(action: {
            flipCard(card)
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isFaceUp ? Color.white : Color.blue)

                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.5), lineWidth: 2)

                if isFaceUp {
                    Text(card.emoji)
                        .font(.system(size: 38))
                } else {
                    Text("?")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .aspectRatio(0.8, contentMode: .fit)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(
            matchedCards.contains(card.id)
            || selectedCards.contains(card.id)
            || isChecking
        )
        .opacity(matchedCards.contains(card.id) ? 0.75 : 1.0)
    }

    // Reveals a card and checks for a matching pair.
    private func flipCard(_ card: MemoryCard) {

        // Ignore taps on matched cards or during a mismatch delay.
        guard !isChecking,
              !matchedCards.contains(card.id),
              !selectedCards.contains(card.id) else {
            return
        }

        // Reveal the selected card.
        selectedCards.append(card.id)

        // Wait until two cards have been selected.
        guard selectedCards.count == 2 else {
            return
        }

        moves += 1

        // Find the two selected cards.
        let firstID = selectedCards[0]
        let secondID = selectedCards[1]

        let firstCard = cards.first { $0.id == firstID }
        let secondCard = cards.first { $0.id == secondID }

        // Keep matching cards visible.
        if firstCard?.emoji == secondCard?.emoji {
            matchedCards.insert(firstID)
            matchedCards.insert(secondID)
            selectedCards.removeAll()
        } else {
            // Briefly show unmatched cards, then turn them over.
            isChecking = true

            DispatchQueue.main.asyncAfter(
                deadline: .now() + 0.8
            ) {
                selectedCards.removeAll()
                isChecking = false
            }
        }
    }

    // Resets the game with a freshly shuffled deck.
    private func restartGame() {
        cards = MemoryCard.makeDeck()
        selectedCards.removeAll()
        matchedCards.removeAll()
        moves = 0
        isChecking = false
    }
}

