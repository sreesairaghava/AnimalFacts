//
//  Facts.swift
//  AnimalFacts
//
//  Created by Sree Sai Raghava Dandu on 23/03/22.
//

import Foundation

struct Fact: Codable, Identifiable {
    let id: UUID = UUID()
    var text: String
    var type: String
}

class Api: ObservableObject {
    @Published var facts = [Fact]()

    func loadData(completion:@escaping ([Fact]) -> ()) {
        let urlString = "https://cat-fact.herokuapp.com/facts/random?amount=10"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let facts = try! JSONDecoder().decode([Fact].self, from: data!)
            print("DEBUG: facts \(facts)")
            DispatchQueue.main.async {
                completion(facts)
            }
        }.resume()
    }
}
