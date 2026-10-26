//  Midterm Project
//  Name: Antonio Campbell-Rodriguez
//  Date: October 26, 2026

import SwiftUI

struct ContentView: View {

    let subjects = Bundle.main.decode(
        [Subject].self,
        from: "Data.json"
    )

    var body: some View {
        NavigationView {
            List(subjects) { subject in
                NavigationLink(
                    destination: SubjectDetailView(subject: subject)
                ) {
                    HStack(spacing: 15) {
                        Image(subject.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90, height: 75)
                            .clipped()
                            .cornerRadius(8)

                        Text(subject.name)
                            .font(.headline)
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationBarTitle("Antonio's Fitness Guide")
        }
    }
}

struct SubjectDetailView: View {

    let subject: Subject

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Image(subject.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .cornerRadius(12)

                Text(subject.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Exercise Description")
                    .font(.headline)

                Text(subject.description)
                    .font(.body)
                    .lineSpacing(5)
            }
            .padding()
        }
        .navigationBarTitle(subject.name, displayMode: .inline)
    }
}


