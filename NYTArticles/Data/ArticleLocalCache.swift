// Data/Persistence/ArticleLocalCache.swift

import Foundation

final class ArticleLocalCache {
    private let cacheKey = "cached_articles"

    func save(_ articles: [Article]) {
        do {
            let data = try JSONEncoder().encode(articles)
            UserDefaults.standard.set(data, forKey: cacheKey)
        } catch {
            print("❌ Error saving articles to cache: \(error)")
        }
    }

    func load() -> [Article]? {
        guard let data = UserDefaults.standard.data(forKey: cacheKey) else {
            return nil
        }

        do {
            let articles = try JSONDecoder().decode([Article].self, from: data)
            return articles
        } catch {
            print("❌ Error loading articles from cache: \(error)")
            return nil
        }
    }
}
