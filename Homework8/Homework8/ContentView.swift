// Assignment 8
// Name: Antonio Campbell-Rodriguez
// Date: October 9, 2026
// Description:
// New Fitness app that lists a variety of
// exercises and their benefits
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Cars")
                    .navigationTitle("Cars")) {
                    Text("Cars")
                }

                NavigationLink(destination: Text("Home")
                    .navigationTitle("Home")) {
                    Text("Home")
                }

                NavigationLink(destination: FitnessView()) {
                    HStack {
                        Image(systemName: "dumbbell")
                        Text("Fitness")
                    }
                }

                NavigationLink(destination: Text("Food")
                    .navigationTitle("Food")) {
                    Text("Food")
                }
            }
            .navigationTitle("Main Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

