//  Lab 2
//  Antonio Campbell-Rodriguez
//  November 2, 2026

import SwiftUI

struct FlowerCard: Identifiable {
    let id = UUID()
    let imageName: String
    var isFaceUp: Bool
}

struct ContentView: View {

    @State private var cards: [FlowerCard] = [
        FlowerCard(imageName: "flower1", isFaceUp: true),
        FlowerCard(imageName: "flower2", isFaceUp: true),
        FlowerCard(imageName: "flower3", isFaceUp: true),
        FlowerCard(imageName: "flower4", isFaceUp: true),
        FlowerCard(imageName: "flower5", isFaceUp: true),
        FlowerCard(imageName: "flower6", isFaceUp: true),
        FlowerCard(imageName: "flower1", isFaceUp: true),
        FlowerCard(imageName: "flower2", isFaceUp: true),
        FlowerCard(imageName: "flower3", isFaceUp: true),
        FlowerCard(imageName: "flower4", isFaceUp: true),
        FlowerCard(imageName: "flower5", isFaceUp: true),
        FlowerCard(imageName: "flower6", isFaceUp: true)
    ]

    private let columns = [
        GridItem(.flexible(), spacing: 22),
        GridItem(.flexible(), spacing: 22),
        GridItem(.flexible(), spacing: 22)
    ]

    var body: some View {
        VStack(spacing: 16) {

            Text("Game")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
                .padding(.top, 4)

            LazyVGrid(columns: columns, spacing: 8) {

                ForEach(cards.indices, id: \.self) { index in

                    Button {
                        cards[index].isFaceUp.toggle()
                    } label: {

                        ZStack {

                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue, lineWidth: 3)

                            if cards[index].isFaceUp {

                                Image(cards[index].imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                    .padding(5)

                            } else {

                                RoundedRectangle(cornerRadius: 9)
                                    .fill(Color.blue.opacity(0.08))
                                    .padding(4)
                            }
                        }
                        .frame(height: 105)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

