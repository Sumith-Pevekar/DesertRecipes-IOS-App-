import SwiftUI

struct URLImage: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                ProgressView()
            }
        }
    }
}
