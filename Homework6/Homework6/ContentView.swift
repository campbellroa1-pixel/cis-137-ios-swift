//  Homework6
//  Assignment #6
//  Name: Antonio Campbell-Rodriguez
//  Date: September 28, 2026

import SwiftUI

struct ContentView: View {
    
    let animals = [
        "star.fill",
        "heart.fill",
        "bird.fill",
        "fish.fill",
        "tortoise.fill",
        "hare.fill",
        "pawprint.fill",
        "ant.fill",
        "ladybug.fill"
    ]
    
    var body: some View {
        ZStack {
            
            
            Image("forest")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
        
            Color.black.opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Animal Grid")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
               
                HStack(spacing: 20) {
                    animalView(animals[0])
                    animalView(animals[1])
                    animalView(animals[2])
                }
                
                
                HStack(spacing: 20) {
                    animalView(animals[3])
                    animalView(animals[4])
                    animalView(animals[5])
                }
                
               
                HStack(spacing: 20) {
                    animalView(animals[6])
                    animalView(animals[7])
                    animalView(animals[8])
                }
            }
            .padding()
        }
    }
    
    func animalView(_ imageName: String) -> some View {
        Image(systemName: imageName)
            .font(.system(size: 45))
            .foregroundStyle(.white)
            .frame(width: 85, height: 85)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

