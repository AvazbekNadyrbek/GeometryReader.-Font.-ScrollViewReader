//
//  Header.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 02.09.25.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(.menu)
                .resizable()
                .scaledToFill()
                .frame(width: 26, height: 18)
            Spacer()
            Text("Hello, Avazbek")
                .font(asimovian: .regular, size: 20)
            Spacer()
            Image(.bag)
                .resizable()
                .scaledToFill()
                .frame(width: 26, height: 18)
                .padding(8)
                .background(
                    Circle()
                        .fill(.white)
                )
                .overlay {
                    Circle()
                        .fill(.orange)
                        .frame(width: 6, height: 6)
                        .offset(x: 10, y: -10)
                }
                
        }
        
    }
}

#Preview {
    Header()
}
