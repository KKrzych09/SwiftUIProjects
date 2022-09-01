//
//  Model.swift
//  JSONReader
//
//  Created by Kamil Krzych on 01/09/2022.
//

import Foundation


struct Feed: Codable {
    let items: [Article]
}

struct Article: Codable {
    let url: URL
    let title: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case url, title, content = "content_html"
    }
}

class Model: ObservableObject {
    @Published var feed: Feed? = Feed(
        items: [
            Article(url: URL(string: "mock://x/a1.html")!, title: "Article1", content: "One"),
            Article(url: URL(string: "mock://x/a2.html")!, title: "Article2", content: "Two"),
            Article(url: URL(string: "mock://x/a3.html")!, title: "Article3", content: "Three")
        ]
    )
    
    var task: URLSessionDataTask?
    init() {
        let request = URLRequest(url: URL(string: "https://www.cocoawithlove.com/feed.json")!)
        task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let error = error { throw error }
                let feed = try JSONDecoder().decode(Feed.self, from: data ?? Data())
                DispatchQueue.main.async { self.feed = feed}
            } catch {}
        }
        task?.resume()
    }
}
