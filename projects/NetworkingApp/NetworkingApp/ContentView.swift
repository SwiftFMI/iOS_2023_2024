//
//  ContentView.swift
//  NetworkingApp
//
//  Created by Emil Atanasov on 12/05/23.
//

import SwiftUI
import Combine


let apiUrl = "https://dog.ceo/api/breeds/image/random"

struct ContentView: View {
    @State var cancellables = Set<AnyCancellable>()
    let url = URL(string: apiUrl)
    @State var asyncImageUrl: URL?
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            AsyncImage(url: asyncImageUrl)
        }
        .padding()
        .onAppear {
            // DO a request
            guard let url else {
                print("Invalid url: \(apiUrl)!")
                return
            }
            
            let urlRequest = URLRequest(url: url) //, method: .get)
            
            // класически начин с callback
            
//            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//                guard let data else {
//                    print("Error: \(error)")
//                    print("No data!")
//                    return
//                }
//                let json = String(data: data, encoding: .utf8)
//                
//                let jsonDecoder = JSONDecoder()
//                if let dogApiResponse = try? jsonDecoder.decode(DogApiResponse.self, from: data) {
//                    asyncImageUrl = URL(string: dogApiResponse.message)
//                    print("JSON: \(dogApiResponse)")
//                }
////                print("Response: \(response)")
//            }
            
//            task.resume()
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .sink { completion in
                    if case .failure(let error) = completion {
                        print("DataImporter.runImport failed with error: \(error)")
                    }
                } receiveValue: { data in
                    let jsonDecoder = JSONDecoder()
                    if let dogApiResponse = try? jsonDecoder.decode(DogApiResponse.self, from: data) {
                        asyncImageUrl = URL(string: dogApiResponse.message)
                        print("JSON: \(dogApiResponse)")
                    }
                }
                .store(in: &self.cancellables)            
        }
    }
}


//{
//    "message": "https://images.dog.ceo/breeds/african/n02116738_10614.jpg",
//    "status": "success"
//}

struct DogApiResponse: Codable {
    var message: String
    var status: String
}

#Preview {
    ContentView()
}
