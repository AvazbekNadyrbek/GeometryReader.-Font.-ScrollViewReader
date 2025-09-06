//
//  mainCard.swift
//  GeometryReader. Font. ScrollViewReader
//
//  Created by Авазбек Надырбек уулу on 04.09.25.
//

import SwiftUI

struct mainCard: View {

    @State private var liked: Set<Int> = []
    private let products = Product.samples
    private let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(products) { product in
                ProductCard(
                    title: product.title,
                    badge: product.badge,
                    price: product.price,
                    imageName: product.imageName,
                    isLiked: Binding(
                        get: { liked.contains(product.id) },
                        set: { newValue in
                            if newValue { liked.insert(product.id) } else { liked.remove(product.id) }
                        }
                    ),
                    onAdd: {
                        print("Add to cart: \(product.title)")
                    }
                )
            }
        }
    }
}

struct CircleIconButton: View {
    @Binding var isLike: Bool

    var systemName: String
    var foreground: Color = .primary
    var background: Color = Color.gray.opacity(0.15)
    var action: () -> Void
    var circleSize: CGFloat = 28
    var iconSize: CGFloat = 14
    var borderColor: Color = Color.gray.opacity(0.25)

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .symbolVariant(isLike ? .fill : .none)
                .contentTransition(.symbolEffect(.replace))
                .symbolEffect(.bounce, value: isLike)
                .font(.system(size: iconSize, weight: .semibold))
                .frame(width: circleSize, height: circleSize)
                .foregroundStyle(foreground)
                .background(background, in: Circle())
                .overlay(
                    Circle()
                        .stroke(borderColor, lineWidth: 0.5)
                )
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

struct AddCornerButton: View {
    var size: CGFloat = 44
    var cornerRadius: CGFloat = 14
    var systemName: String = "plus"
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 18, weight: .bold))
                .frame(width: size, height: size)
                .foregroundStyle(.white)
                .background(
                    Color.blue,
                    in: UnevenRoundedRectangle(
                        cornerRadii: .init(topLeading: cornerRadius, bottomLeading: 0, bottomTrailing: cornerRadius, topTrailing: 0)
                    )
                )
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Add to cart")
    }
}

struct ProductCard: View {
    let title: String
    let badge: String
    let price: String
    let imageName: String
    @Binding var isLiked: Bool
    var onAdd: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.white)
                .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)

            VStack(alignment: .leading, spacing: 10) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 96)
                    .frame(maxWidth: .infinity)

                Text(badge)
                    .textCase(.uppercase)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.blue)

                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.gray)

                HStack {
                    Text(price)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.black)
                    Spacer()
                }
            }
            .padding(16)
        }
        .overlay(alignment: .topLeading) {
            CircleIconButton(isLike: $isLiked, systemName: "heart", foreground: .red) {
                isLiked.toggle()
            }
            .padding(12)
        }
        .overlay(alignment: .bottomTrailing) {
            AddCornerButton {
                onAdd()
            }
        }
    }
}

#Preview {
    mainCard()
}