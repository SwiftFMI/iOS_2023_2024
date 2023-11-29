//
//  CanvasDemoView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/09/23.
//

import SwiftUI

struct CanvasDemoView: View {
    let backgroundColor = Color(.sRGB, red: 230/255, green: 240/255, blue: 1, opacity: 1.0)
    var body: some View {
        ZStack {
            Canvas(opaque: true, colorMode: .linear, rendersAsynchronously: true) { context, size in
                //background
                context.fill(
                    Path(
                        CGRect(origin: .zero, size: size)),
                    with: .color(.green))
                
                var squarePath = Path()
                squarePath.move(to: CGPoint(x: 50, y: 50))
                squarePath.addLine(to: CGPoint(x: 100, y: 50))
                squarePath.addLine(to: CGPoint(x: 100, y: 100))
                squarePath.addLine(to: CGPoint(x: 50, y: 100))
                
                context.fill(squarePath, with: .color(.blue))
            }
            .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                print("Button touched")
                var a = MySingleton.instance
                a.setData(v: 300)
                a.printMe()
                MySingleton.instance.printMe()
                MySingleton.instance.setData(v: 200)
                MySingleton.instance.printMe()
            }, label: {
                Text("Button")
            })
            .buttonStyle(.bordered)
            
            Canvas(opaque: false, colorMode: .linear, rendersAsynchronously: true) { context, size in
                //background
//                context.fill(
//                    Path(
//                        CGRect(origin: .zero, size: size)),
//                    with: .color(backgroundColor))
                
                var squarePath = Path()
                squarePath.move(to: CGPoint(x: 50, y: 50))
                squarePath.addLine(to: CGPoint(x: 100, y: 50))
                squarePath.addLine(to: CGPoint(x: 100, y: 100))
                //               squarePath.addLine(to: CGPoint(x: 50, y: 100))
                context.fill(squarePath, with: .color(.blue))
                squarePath = Path()
                squarePath.move(to: CGPoint(x: 50, y: 50))
                squarePath.addLine(to: CGPoint(x: 100, y: 100))
                squarePath.addLine(to: CGPoint(x: 50, y: 100))
                
                
                context.fill(squarePath, with: .color(.green))
                
                var myPath = Path(CGRect(x: 20, y: 200, width: 100, height: 20))
                
                context.fill(myPath, with: .color(.pink))
                context.stroke(myPath, with: .color(.brown), style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                let w = size.width
                let h = size.height
                
                let img = Image(systemName: "person.fill")
                //                .background(Color.green)
                
                // Draw Images
                
                let text = Text("SwiftUI Canvas").bold().italic().foregroundColor(.blue)
                context.addFilter(.blur(radius: 0.9))
                // Draw Text
                context.draw(text, at: CGPoint(x: w / 2, y: h / 2))
                
                context.draw(img, at: CGPoint(x: w / 2, y: h / 2))
                
                
            }
//            .frame(height: 300)
            .allowsHitTesting(false)
//            .edgesIgnoringSafeArea(.all)
            
            
        }
    }
}

#Preview {
    CanvasDemoView()
}
