//
//  SearchView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .navigationTitle("Searchable Example")
        }
        .searchable(text: $searchText, prompt: "Look for something")
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
