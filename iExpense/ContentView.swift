//
//  ContentView.swift
//  iExpense
//
//  Created by Alonso Acosta Enriquez on 17/10/25.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user: User = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(user) {
                // With that kind of data is better to use Defaults like the line below
                // instead of @AppStorage
                UserDefaults.standard.set(encoded, forKey: "iexpense_user")
            }
        }
    }
}

#Preview {
    ContentView()
}
