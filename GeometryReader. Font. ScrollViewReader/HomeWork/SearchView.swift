//
//  SearchView.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 02.09.25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search", text: $searchText)
                    .textFieldStyle(.plain)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 40)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
            )
            
            Button {
                print("Button is pressed")
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(.menu))
                    )
                    
            }

        }
    }
}

#Preview {
    SearchView()
}
