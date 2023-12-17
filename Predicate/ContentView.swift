//
//  ContentView.swift
//  Predicate
//
//  Created by Marek Sienczak on 17/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            ItemsView(searchText: searchText)
                .searchable(text: $searchText)
        }
        .overlay {
            if items.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Data", systemImage: "plus.app")
                }, description: {
                    Text("New items you add will appear here.")
                }, actions: {
                    Button(action: { addItems() }) {
                        Text("Add sample data")
                    }
                })
            }
        }
    }

    private func addItems() {
        let item1 = Item("First item")
        let item2 = Item("Second item")
        let item3 = Item("Third item")
        let tag0 = Tag("best")
        let tag1 = Tag("first")
        let tag2 = Tag("second")
        let tag3 = Tag("third")
        modelContext.insert(item1)
        item1.tags = [tag0, tag1]
        modelContext.insert(item2)
        item2.tags = [tag0, tag2]
        modelContext.insert(item3)
        item3.tags = [tag3]
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
