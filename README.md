
# SwiftUI GeometryReader, Custom Fonts & ScrollViewReader Demo

A compact SwiftUI project showcasing:
- GeometryReader for responsive/scroll-aware layouts and parallax effects
- Custom fonts via `.font(.custom)` and convenience modifiers
- Programmatic scrolling with ScrollViewReader
- Horizontal category scroller + vertical product feed
- Modern SwiftUI patterns (LazyVGrid, bindings, overlays, symbol effects)

## Features

- Header + search bar UI with shadows and rounded backgrounds
- Horizontal category pills (scrollable)
- Tapping a category scrolls the vertical content to its section
- Product grid with like and add-to-cart buttons
- Parallax header image + fading sticky header via GeometryReader
- Custom fonts (Asimovian, StoryScript) using helper extensions
- Smooth animations with `withAnimation(.spring())`

## Project Structure

- HomeWork/
  - MainScreen.swift — Horizontal categories + vertical sections using ScrollViewReader
  - CategoryView.swift — Category pill component
  - Header.swift — Top bar with title and icons
  - SearchView.swift — Search field with trailing filter button
  - mainCard.swift — Product grid (LazyVGrid), ProductCard, like/add actions
  - DataModel/
    - Product.swift — Identifiable product model, sample data
- GeomentryReader.swift — Parallax header + fading sticky header example
- ScrollProvider.swift — Alternate ScrollViewReader demo with a horizontal menu
- ContentView.swift — Custom fonts demo and helpers
- ContentViewHomeWork.swift — Placeholder

## ScrollViewReader: Problem & Solution

### The Problem
We needed both:
- A horizontally scrolling category bar
- Programmatic scrolling of a vertical content list to the matching section

Common pitfalls:
- Nesting multiple ScrollViews inside a single ScrollViewReader can confuse the proxy
- Making each category fill the width (e.g., `.frame(maxWidth: .infinity)`) breaks horizontal scrolling
- Misaligned IDs or missing `.id()` prevent `scrollTo` from working

### The Solution We Implemented
- Wrap only the vertical ScrollView with `ScrollViewReader`
- Capture its `ScrollViewProxy` in `@State`
- Use that proxy from the horizontal category buttons to scroll the vertical list

### The UI Screen

<img width="304" height="564" alt="Screenshot 2025-09-06 at 12 33 15" src="https://github.com/user-attachments/assets/0f1c5015-ba5e-4dd4-9f78-270bff99aea0" />

