//
//  Homework5
//
//  Assignment #5
//  Full Name: Antonio Campbell-Rodriguez
//  Date: September 22, 2026
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, my name is Antonio Campbell-Rodriguez!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.blue)

            Image("helloWorld")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
        }
        .padding()
    }
}
