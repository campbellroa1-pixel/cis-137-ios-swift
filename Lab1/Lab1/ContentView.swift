//  Lab1
//  Name: Antonio Campbell-Rodriguez
//  Date: September 28, 2026

import SwiftUI
struct ContentView: View {

    let dogNames = [
        "Airedale Terrier",
        "American Foxhound",
        "Dutch Shepherd",
        "Havanese",
        "Leonberger",
        "Mudi",
        "Norwegian Lundehund",
        "Pharaoh Hound",
        "Scottish Terrier",
        "Tosa"
    ]

    let descriptions = [
        "The Airedale stands among the world's most versatile dog breeds and has distinguished himself as hunter, athlete, and companion.",

        "American Foxhounds are good-natured, low-maintenance hounds who get on well with kids, dogs, even cats.",

        "The Dutch Shepherd is a lively, athletic, alert and intelligent breed.",

        "Havanese, the only dog breed native to Cuba, are vivacious and sociable companions.",

        "The Leonberger is a lush-coated giant of German origin with a gentle nature.",

        "The Mudi is an extremely versatile, intelligent, alert, agile farm dog.",

        "The Norwegian Lundehund was originally bred for puffin hunting and is now a friendly companion.",

        "The Pharaoh Hound is an elegant but rugged sprinting hound.",

        "The Scottish Terrier is an independent, confident companion of high spirits.",

        "The Tosa is patient, composed, bold, and courageous."
    ]

    @State private var selectedDog = ""

    var body: some View {

        // Dictionary
        let dogDict = Dictionary(uniqueKeysWithValues: zip(dogNames, descriptions))

        VStack {

            // Instruction text
            Text("Tap a dog image to learn more!")
                .font(.title2)
                .padding()

            HStack {
                dogImage("Airedale Terrier")
                dogImage("American Foxhound")
            }

            HStack {
                dogImage("Dutch Shepherd")
                dogImage("Havanese")
            }

            HStack {
                dogImage("Leonberger")
                dogImage("Mudi")
            }

            HStack {
                dogImage("Norwegian Lundehund")
                dogImage("Pharaoh Hound")
            }

            HStack {
                dogImage("Scottish Terrier")
                dogImage("Tosa")
            }

            if !selectedDog.isEmpty {
                Text(dogDict[selectedDog] ?? "")
                    .padding()
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .padding()
    }

    func dogImage(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .onTapGesture {
                selectedDog = name
            }
    }
}
