//
//  GeomentryReader.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 31.08.25.
//

import SwiftUI

struct GeomentryReader: View {
    
    @State var headerOpacity: Double = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Text("Header")
                    .padding()
                    .padding(.top, 40)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .zIndex(1)
            .opacity(headerOpacity)
            
            ScrollView {
                VStack {
        
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                            Image(.bear)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: proxy.size.width)
                                .frame(height: 300 + (minY > 0 ? minY : 0))
                                .offset(y: -minY < 0 ? -minY : 0)
                                .onChange(of: minY) { _, newValue in
                                    headerOpacity = -minY / 300
                                }
                        }
                        .frame(height: 300)
                   

                    VStack {
                        ForEach(0...20, id: \.self) { item in
                            Text(item.description)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.gray )
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }

    }
}

#Preview {
    GeomentryReader()
}
