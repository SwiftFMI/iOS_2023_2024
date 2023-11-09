//
//  ContainersView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/07/23.
//

import SwiftUI

struct ContainersView: View {
    var body: some View {
        ScrollView {
            VStack(alignment:.leading ,spacing: 10) {
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                Button {
                    print("hello")
                } label: {
                    Text("Hello")
                }
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                VStack {
                    Text("Separator")
                }
                .frame(maxWidth: .infinity)
                Text("Separator")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.red)
                Button {
                    print("hi")
                } label: {
                    Text("Hi")
                }
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                Text("Separator")
                Text("Separator")
                Text("Separator")
                Text("Separator")
                            Rectangle()
                                .frame(height: 100)
                                .foregroundColor(.green)
                Group {
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

struct HorizontalContainerView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top,spacing: 20) {
                Button {
                    print("last item")
                } label: {
                    Text("🐻")
                        .font(.largeTitle)
                        
                        .frame(width: 100, height: 100)
                        .background(Color.green)
                }
                
                Button {
                    print("last item")
                } label: {
                    Text("🐻")
                        .font(.largeTitle)
                        
                        .frame(width: 100, height: 200)
                        .background(Color.pink)
                }
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                Button {
                    print("hello")
                } label: {
                    Text("Hello")
                }
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                VStack {
                    Text("Separator")
                }
//                .frame(maxWidth: .infinity)
                Text("Separator")
                    .multilineTextAlignment(.center)
//                    .frame(maxWidth: .infinity)
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.red)
                Button {
                    print("hi")
                } label: {
                    Text("Hi")
                }
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                Text("Separator")
                Text("Separator")
                Text("Separator")
                Text("Separator")
                            Rectangle()
                                .frame(height: 100)
                                .foregroundColor(.green)
                Group {
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                        .foregroundStyle(.red)
                }
                Group {
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                    Text("Separator")
                        .foregroundStyle(.red)
                }
                
            }
            

        }
    }
}

struct HorizontalContainerWithSpacerView: View {
    var body: some View {
//        ScrollView(.horizontal) {
            HStack(alignment: .top) {
//                Button {
//                    print("last item")
//                } label: {
//                    Text("🐻")
//                        .font(.largeTitle)
//                        
//                        .frame(width: 100, height: 100)
//                        .background(Color.green)
//                }
//                .padding([.leading,.trailing], 20)
//                Spacer()
                Button {
                    print("last item")
                } label: {
                    Text("🐻")
                        .font(.largeTitle)
                        .frame(width: 100, height: 200)
                        .background(Color.pink)
                }
//                Spacer()
//                Button {
//                    print("last item")
//                } label: {
//                    Text("🐻")
//                        .font(.largeTitle)
//                        
//                        .frame(width: 100, height: 100)
//                        .background(Color.green)
//                }
            }
            .frame(maxWidth: .infinity)
            .overlay {
                VStack {
                    Text("Text")
                }
                
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            }
//        }
    }
}

struct ZContainerWithSpacerView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                Button {
                    print("pink button item")
                } label: {
                    Text("🐻")
                        .font(.largeTitle)
                        .frame(width: 100, height: 200)
                        .background(Color.pink)
                }
                
                Button {
                    print("green button item")
                } label: {
                    Text("🐻")
                        .font(.largeTitle)
                        .frame(width: 30, height: 30)
                        .background(Color.green)
                }
            }
    }
}


struct LazyVContainerView: View {
    var body: some View {
        ScrollView() {
            LazyVStack {
                ForEach(1...100, id: \.self) {
//                    let _ = print("new item \($0)")
                    MyListItemView(label: "\($0)")
                }
            }
        }
    }
}

struct LazyHContainerView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
//                    let _ = print("new item \($0)")
                    MyListItemView(label: "\($0)")
                }
            }
        }
    }
}


struct GridContainerView: View {
    var body: some View {
//        Grid {
//            GridRow {
//                MyListItemView(label: "Row 1, Col 1")
//                Image(systemName: "globe")
//            }
//            Divider()
//                .gridCellUnsizedAxes(.horizontal)
//            GridRow {
//                Image(systemName: "hand.wave")
//                Text("World")
//            }
//            Divider()
//                .gridCellUnsizedAxes(.horizontal)
//            GridRow {
//                Image(systemName: "tray.fill")
//                    .frame(maxWidth: .infinity)
//                    .background(Color.red)
//                    
//                MyListItemView(label: "Row 3, Col 2")
//            }
//        }
//        .padding(20)
        
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in Color.red }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { ($0 % 2 == 0) ? Color.green : Color.blue }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { ($0 % 2 != 0) ? Color.green : Color.blue }
            }
        }
    }
}

struct MyListItemView: View {
    var label: String
    var body: some View {
        VStack {
            Text("Column \(label)")
            Image(systemName: "square.and.arrow.up")
        }
    }
}

#Preview("VStack") {
        ContainersView()
        //        .environment(\.locale, .init(identifier: "de"))
            .environment(\.layoutDirection, .rightToLeft)
}

#Preview("HStack") {
    HorizontalContainerView()
            .environment(\.layoutDirection, .leftToRight)
}

#Preview("HStack with Spacer") {
    HorizontalContainerWithSpacerView()
}

#Preview("ZStack") {
    ZContainerWithSpacerView()
        .environment(\.layoutDirection, .rightToLeft)
}


#Preview("LazyHStack") {
    LazyHContainerView()
}

#Preview("LazyVStack") {
    LazyVContainerView()
}

#Preview("Grid") {
    GridContainerView()
}
