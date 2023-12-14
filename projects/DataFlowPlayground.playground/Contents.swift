//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport


struct MyView: View {
    let title: String = "Option 1"
    @State var isEnabled = false
    var body: some View {
        // тук предаваме binding
        CustomToggleView(title: title, isEnabled: $isEnabled)
    }
}

struct CustomToggleView: View {
    var title: String
    // изискваме write достъп до състоянието с binding
    @Binding var isEnabled: Bool
    var body: some View {
        // тук предаваме binding
        Toggle(isOn: $isEnabled) {
            Text("\(title)")
                .bold()
        }
    }
}

/// Пример с ObservableObject
///
class Car: ObservableObject {
    @Published var name: String
    @Published var maxSpeed: Int
    
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
}

struct ObservedObjectExampleView: View {
    @StateObject var car = Car(name: "Tesla", maxSpeed: 250)
    var body: some View {
        VStack {
            BannerView()
                .environmentObject(car)
            CarView(name: $car.name, maxSpeed: $car.maxSpeed)
        }
    }
}

struct BannerView: View {
    // въпреки, че не се използва
    // промяна в инстанцията предизвика оценка на body
    @EnvironmentObject var car: Car
    var body: some View {
        let _ = print("\(#function)")
        Text("🚗 🚙 🏎️")
    }
}

struct CarView: View {
    @Binding var name: String
    @Binding var maxSpeed: Int
    var body: some View {
        VStack {
            Text("\(name)")
                .font(.title)
            Text("Max Speed: \(maxSpeed)")
            Button {
                maxSpeed += 5
            } label: {
                Text("Tuning")
            }
            .buttonStyle(.bordered)
            .tint(.green)

        }
    }
}

struct CustomBindingExampleView: View {
    @StateObject var car = Car(name: "Tesla", maxSpeed: 250)
    var body: some View {
        VStack {
            BannerView()
                .environmentObject(car)
            CarView(name: $car.name, maxSpeed: Binding(get: {
                car.maxSpeed
            }, set: { newValue in
                car.maxSpeed = newValue
            }))
        }
    }
}



/// С какво се различават @State и @StateObject
/// @State се инициализира всеки път, докато @StateObject се инициализира при смяна на id-то на компонент


// Present the view controller in the Live View window
//let view = MyView()
//let view = ObservedObjectExampleView()
let view = CustomBindingExampleView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC
