import SwiftUI
import Combine


final class PostListViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    func load() async {
        isLoading = true
        errorMessage = nil
        do {
            guard let url = URL(string: "https://dummyjson.com/posts") else {
                throw URLError(.badURL)
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(PostDataModel.self, from: data)
            posts = decoded.posts
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

struct PostListScreen: View {
    @StateObject private var viewModel = PostListViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                VStack(spacing: 16) {
                    Text(error)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        Task {
                            await viewModel.load()
                        }
                    }
                }
                .padding()
            } else {
                List(viewModel.posts, id: \.id) { post in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .lineLimit(2)
                        Text(post.tags.joined(separator: ", "))
                            .font(.caption)
                            .foregroundColor(.secondary)
                        HStack(spacing: 20) {
                            Text("👍 \(post.reactions.likes)")
                            Text("👎 \(post.reactions.dislikes)")
                        }
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.plain)
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    PostListScreen()
}
