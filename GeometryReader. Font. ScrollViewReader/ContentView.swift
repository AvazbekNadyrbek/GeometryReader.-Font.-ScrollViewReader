//
//  ContentView.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 31.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.custom("Asimovian", size: 30))
            Text("Hello, world!")
                .font(.custom("StoryScript-Regular", size: 30))
            Text("Hello, world!")
                .font(asimovian: .regular, size: 30)
            Text("Hello, world!")
                .font(storyScript: .regular, size: 30)
        }
        .padding()
    }
}

enum Asimovian: String {
    case regular = "Asimovian"
}

enum StoryScript: String {
    case regular = "StoryScript-Regular"
}

extension View {
    func font(asimovian: Asimovian, size: CGFloat = 16) -> some View {
        self.font(.custom(asimovian.rawValue, size: size))
    }
    
    func font(storyScript: StoryScript, size: CGFloat = 16) -> some View {
        self.font(.custom(storyScript.rawValue, size: size))
    }
}

#Preview {
    ContentView()
}
