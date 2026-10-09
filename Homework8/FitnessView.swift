
import SwiftUI

struct FitnessView: View {
    @State private var exercises: [FitnessItem] = []

    var body: some View {
        List(exercises) { exercise in
            VStack(alignment: .leading, spacing: 6) {
                Text(exercise.name)
                    .font(.headline)

                Text(exercise.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Fitness")
        .onAppear {
            loadExercises()
        }
    }

    func loadExercises() {
        guard let url = Bundle.main.url(
            forResource: "fitness",
            withExtension: "json"
        ) else {
            print("ERROR: fitness.json not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)

            exercises = try JSONDecoder().decode(
                [FitnessItem].self,
                from: data
            )
        } catch {
            print("ERROR loading fitness data: \(error)")
        }
    }
}

struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FitnessView()
        }
    }
}

