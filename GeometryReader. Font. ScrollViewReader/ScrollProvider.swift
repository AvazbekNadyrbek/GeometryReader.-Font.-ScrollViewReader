//
//  ScrollProvider.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 31.08.25.
//

import SwiftUI

struct ScrollProvider: View {
    
    var menu: [String] = ["Sushi", "Rolls", "Stir-fry", "Salate", "Wok"]
    
    var body: some View {
        
        ScrollViewReader { proxy in
            VStack {
                GeometryReader { geo in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 20) {
                            Button {
                                withAnimation{
                                    proxy.scrollTo("Sushi", anchor: .top)
                                }
                            } label: { Text("Sushi") }
                            Button {
                                
                                withAnimation{
                                    proxy.scrollTo("Rolls", anchor: .top)
                                }
                                
                            } label: { Text("Rolls") }
                            Button {
                                
                                withAnimation {
                                    proxy.scrollTo( "Stir-fry", anchor: .top)
                                }
                                
                            } label: { Text("Stir-fry") }
                            Button {
                                withAnimation {
                                    proxy.scrollTo( "Salate", anchor: .top)
                                }
                                
                            } label: { Text("Salate") }
                            Button {
                                
                                withAnimation {
                                    proxy.scrollTo( "Wok", anchor: .top)
                                }
                                
                            } label: { Text("Wok") }
                        }
                        .frame(minWidth: geo.size.width, alignment: .center)
                        .padding(.horizontal)
                        
                    }
                }
                .frame(height: 50)
                
                ScrollView {
                    VStack {
                        ForEach(menu, id: \.self) { item in
                            Text(item.description)
                                .frame(width: 300, height: 300)
                                .background(Color.gray)
                                .id(item)
                        }
                    }
                }
            }
        }
        
       
    }
}

#Preview {
    ScrollProvider()
}
