//
//  MainScreen.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 02.09.25.
//

import SwiftUI

struct MainScreen: View {
    var menu: [String] = ["Все", "Outdoor", "Tennis", "Basketball", "Football", "Running", "Cycling", "Swimming", "Volleyball", "Boxing"]
    
    @State private var scrollProxy: ScrollViewProxy?
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Header()
                SearchView()
                    .shadow(color: .gray.opacity(0.4), radius: 5)
            }
            
            Text("Категории")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black).opacity(0.8)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(menu, id: \.self) { name in
                        Button {
                            withAnimation(.spring()) {
                                scrollProxy?.scrollTo(name, anchor: .top)
                            }
                        } label: {
                            CategoryView(text: name)
                        }
                    }
                }
                .padding(.vertical, 10)
            }
            
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 30) {
                        ForEach(menu, id: \.self) { name in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(name)
                                    .font(.headline)
                                mainCard()
                            }
                            .id(name)
                        }
                    }
                    .padding(.top, 20)
                }
                .onAppear {
                    scrollProxy = proxy
                }
            }
        }
        .padding(.horizontal, 20)
        .background(Color(.bg))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MainScreen()
}
