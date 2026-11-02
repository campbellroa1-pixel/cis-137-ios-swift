// Assignment 11
// Name: Antonio Campbell-Rodriguez
// Date: November 2, 2026

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            FestivalView(
                title: "Halloween",
                imageName: "Halloween",
                description: "Halloween is celebrated on October 31. It is a holiday where people dress up in costumes, decorate their homes, carve pumpkins, and go trick or treating.",
                traditions: "Popular traditions include wearing costumes, carving jack-o'lanterns, visiting haunted houses, and collecting candy."
            )
            .tabItem {
                Image(systemName: "moon.stars.fill")
                Text("Halloween")
            }

            FestivalView(
                title: "Thanksgiving",
                imageName: "Thanksgiving",
                description: "Thanksgiving is a holiday celebrated in the United States on the fourth Thursday of November. It is a time to appreciate family, friends, and everything we are thankful for.",
                traditions: "Popular traditions include sharing a turkey dinner, watching parades, spending time with family, and expressing gratitude."
            )
            .tabItem {
                Image(systemName: "leaf.fill")
                Text("Thanksgiving")
            }

            FestivalView(
                title: "Christmas",
                imageName: "Christmas",
                description: "Christmas is celebrated on December 25. It celebrates the birth of Jesus Christ and is also a time when many people share gifts, enjoy decorations, and spend time with loved ones.",
                traditions: "Popular traditions include decorating Christmas trees, exchanging gifts, singing Christmas songs, and sharing meals with family."
            )
            .tabItem {
                Image(systemName: "gift.fill")
                Text("Christmas")
            }
        }
    }
}

struct FestivalView: View {

    let title: String
    let imageName: String
    let description: String
    let traditions: String

    @State private var message = ""
    @State private var isFavorite = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {

                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 230)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .contextMenu {

                            Button {
                                isFavorite.toggle()
                            } label: {
                                Label(
                                    isFavorite ? "Remove Favorite" : "Add to Favorites",
                                    systemImage: isFavorite ? "heart.slash" : "heart"
                                )
                            }

                            Button {
                                message = traditions
                            } label: {
                                Label(
                                    "View Traditions",
                                    systemImage: "info.circle"
                                )
                            }

                            Button {
                                message = description
                            } label: {
                                Label(
                                    "About This Festival",
                                    systemImage: "book"
                                )
                            }
                        }

                    Text(description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text("Traditions")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(traditions)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    if isFavorite {
                        Label("Added to Favorites", systemImage: "heart.fill")
                            .foregroundColor(.red)
                    }

                    if !message.isEmpty {
                        Text(message)
                            .font(.callout)
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.bottom, 25)
            }
            .navigationTitle("Holiday Festivals")
        }
    }
}
