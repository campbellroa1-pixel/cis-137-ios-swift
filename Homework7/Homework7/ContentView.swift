//Assignment: Homework7
//Name: Antonio Campbell-Rodriguez
//October 5th, 2026
import SwiftUI

// Custom Alignment Guide
extension VerticalAlignment {
    
    private enum BioAlignment: AlignmentID {
        
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[VerticalAlignment.center]
        }
    }
    
    static let bioAlignment = VerticalAlignment(BioAlignment.self)
}


// Main View
struct ContentView: View {
    
    var body: some View {
        
        HStack(
            alignment: VerticalAlignment.bioAlignment,
            spacing: 20
        ) {
            
            // Parent View 1
            VStack(alignment: .leading) {
                
                Image("Antonio")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                
                Text("Antonio")
                    .font(.title)
                    .alignmentGuide(VerticalAlignment.bioAlignment) { dimensions in
                        return dimensions[VerticalAlignment.center]
                    }
            }
            
            
            // Parent View 2
            VStack(alignment: .leading) {
                
                Text("Bio:")
                    .font(.headline)
                
                Text("""
                I am a Computer Science student interested in
                programming, technology, game development,
                and computer animation.
                """)
                .frame(
                    width: 180,
                    alignment: Alignment.leading
                )
            }
            .alignmentGuide(VerticalAlignment.bioAlignment) { dimensions in
                return dimensions[VerticalAlignment.center]
            }
        }
        .padding()
    }
}


// Preview
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
