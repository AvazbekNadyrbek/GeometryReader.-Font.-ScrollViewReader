//
//  CategoryView.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 04.09.25.
//

import SwiftUI

struct CategoryView: View {
    
    var text: String = "name"
    var body: some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundStyle(.black)
            .padding(.horizontal, 25)
            .frame(height: 48)
            .background(.white, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    CategoryView()
        
}