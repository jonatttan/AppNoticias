    fsdfdfssd
fsdfsdfsdlet status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
}

struct Source {
    let id: String?
    let name: String
}
