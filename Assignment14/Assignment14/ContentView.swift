
import SwiftUI

struct ContentView: View {

    // Zoom settings
    @State private var scale: CGFloat = 1.0

    // Drag settings
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    var body: some View {

        VStack(spacing: 15) {

            Text("Mount Fuji, Japan")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Explore the beauty of Japan")
                .foregroundColor(.secondary)

            // Image viewing area
            GeometryReader { geometry in

                ZStack {

                    Color.black.opacity(0.05)

                    Image("MountFuji")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                        .scaleEffect(scale)
                        .offset(offset)
                        .contentShape(Rectangle())

                        // Single tap and double tap
                        .simultaneousGesture(
                            TapGesture(count: 2)
                                .exclusively(before: TapGesture(count: 1))
                                .onEnded { result in

                                    switch result {

                                    case .first:
                                        // Double tap: Zoom out
                                        withAnimation {
                                            scale = max(scale - 0.5, 1.0)
                                        }

                                    case .second:
                                        // Single tap: Zoom in
                                        withAnimation {
                                            scale = min(scale + 0.5, 5.0)
                                        }
                                    }
                                }
                        )

                        // Long press: Reset image
                        .simultaneousGesture(
                            LongPressGesture(minimumDuration: 1)
                                .onEnded { _ in

                                    withAnimation {
                                        scale = 1.0
                                        offset = .zero
                                        lastOffset = .zero
                                    }
                                }
                        )

                        // Drag: Move image
                        .simultaneousGesture(
                            DragGesture()
                                .onChanged { value in

                                    offset = CGSize(
                                        width: lastOffset.width + value.translation.width,
                                        height: lastOffset.height + value.translation.height
                                    )
                                }
                                .onEnded { _ in

                                    lastOffset = offset
                                }
                        )
                }
            }
            .frame(height: 350)

            // Bring enlarged image in front of other views
            .zIndex(scale > 1.0 ? 10 : 0)

            
            Spacer()

            Text("Tap: Zoom In • Double Tap: Zoom Out")
                .font(.footnote)
                .foregroundColor(.secondary)

            Text("Long Press: Reset • Drag: Move")
                .font(.footnote)
                .foregroundColor(.secondary)

            // Reset button
            Button("Reset Image") {

                withAnimation {
                    scale = 1.0
                    offset = .zero
                    lastOffset = .zero
                }
            }
            .padding(.bottom)
        }
        .padding()
    }
}



