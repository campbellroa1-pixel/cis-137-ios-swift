
import SwiftUI

// Lab 3
// Name: Antonio Campbell-Rodriguez
// Date: November 9, 2026

struct ContentView: View {

    @StateObject private var game = FlowerGameViewModel()

    // Creates a four-column card grid.
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        VStack {

            // Game title.
            Text("Flower Match")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Displays game progress.
            Text("Progress")
                .font(.headline)

            ProgressView(value: game.gameProgress)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .padding(.horizontal)

            // Displays progress percentage.
            Text("\(Int(game.gameProgress * 100))%")
                .font(.subheadline)
                .foregroundColor(.gray)

            // Flower card grid.
            LazyVGrid(columns: columns, spacing: 12) {

                ForEach(Array(game.cards.enumerated()), id: \.element.id) { index, card in

                    FlowerCardView(card: card)
                        .onTapGesture {
                            game.chooseCard(at: index)
                        }
                }
            }
            .padding()

            // Victory message.
            if game.matchedPairs == 12 {

                Text("You Win!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding()
            }

            // Restart button.
            Button(action: {
                game.restartGame()
            }) {

                Text("Restart Game")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding()

            Spacer()
        }
    }
}

// Individual card appearance.
struct FlowerCardView: View {

    let card: FlowerCard

    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 12)
                .fill(Color.pink.opacity(0.2))

            if card.isFaceUp || card.isMatched {

                Image("flower\(card.flowerNumber)")
                    .resizable()
                    .scaledToFit()
                    .padding(5)

            } else {

                Image(systemName: "questionmark")
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
        }
        .frame(height: 85)
        .rotation3DEffect(
            .degrees(card.isFaceUp || card.isMatched ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .opacity(card.isMatched ? 0.5 : 1.0)
    }
}

