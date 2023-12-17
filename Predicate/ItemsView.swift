//
//  ItemsView.swift
//  Predicate
//
//  Created by Marek Sienczak on 17/12/2023.
//

import SwiftUI
import SwiftData

struct ItemsView: View {
    @Query var items: [Item]

    var body: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    VStack(alignment: .leading) {
                        Text("Item title: \(item.title)")
                        HStack {
                            Text("Tags:")
                            ForEach(item.tags!, id: \.self) {
                                Text($0.name)
                            }
                        }
                    }
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.title)
                        HStack {
                            ForEach(item.tags!, id: \.self) {
                                Text("#\($0.name)")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }

    init(searchText: String) {
        _items = Query(filter: #Predicate<Item> { item in
            if (searchText.isEmpty) {
                return true
            } else {
                return item.tags!.contains{$0.name.localizedStandardContains(searchText)}
            }
        })
    }
}
