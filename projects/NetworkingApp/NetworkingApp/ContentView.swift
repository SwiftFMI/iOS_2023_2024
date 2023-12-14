//
//  ContentView.swift
//  NetworkingApp
//
//  Created by Emil Atanasov on 12/05/23.
//

import SwiftUI
import Combine
import Alamofire


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
                .frame(height: 500)
                .scaledToFit()
        }
        .padding()
        .onAppear {
            // DO a request
//            guard let url else {
//                print("Invalid url: \(apiUrl)!")
//                return
//            }
//            
//            let urlRequest = URLRequest(url: url) //, method: .get)
//            
//            // класически начин с callback
//            
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
//                    DispatchQueue.main.async {
//                        // code to execute
//                        asyncImageUrl = URL(string: dogApiResponse.message)
//                        print("JSON: \(dogApiResponse)")
//                    }
//                }
////                print("Response: \(response)")
//            }
//            
//            task.resume()
            
//            URLSession.shared.dataTaskPublisher(for: url)
//                .map(\.data)
//                .sink { completion in
//                    if case .failure(let error) = completion {
//                        print("DataImporter.runImport failed with error: \(error)")
//                    }
//                } receiveValue: { data in
//                    let jsonDecoder = JSONDecoder()
//                    if let dogApiResponse = try? jsonDecoder.decode(DogApiResponse.self, from: data) {
//                        asyncImageUrl = URL(string: dogApiResponse.message)
//                        print("JSON: \(dogApiResponse)")
//                    }
//                }
//                .store(in: &self.cancellables) 
//            
//            // How to use async await
            
            Task {
//                do {
//                    var dogApiResponse = try await fetchData("run#1")
//                    dogApiResponse = try await fetchData("run#2")
//                    dogApiResponse = try await fetchData("run#3")
//                    
//                    async let dog1 = try fetchData("asyncRun1")
//                    async let dog2 = try fetchData("asyncRun2")
//                    async let dog3 = try fetchData("asyncRun3")
//                    
//                    let array = await [try dog1, try dog2, try dog3]
//                    
//                    asyncImageUrl = URL(string: dogApiResponse.message)
//                } catch {
//                    print("Some error: \(error)")
//                }
                
                
                // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
                let response = await AF.request(apiUrl, interceptor: .retryPolicy)
                                       // Automatic HTTP Basic Auth.
//                                       .authenticate(username: "user", password: "pass")
                                       // Caching customization.
                                       .cacheResponse(using: .cache)
                                       // Redirect customization.
                                       .redirect(using: .follow)
                                       // Validate response code and Content-Type.
                                       .validate()
                                       // Produce a cURL command for the request.
                                       .cURLDescription { description in
                                         print(description)
                                       }
                                       // Automatic Decodable support with background parsing.
                                       .serializingDecodable(DogApiResponse.self)
                                       // Await the full response with metrics and a parsed body.
                                       .response
                // Detailed response description for easy debugging.
                debugPrint(response)                
                
                if let dogApiResponse = response.value {
                    asyncImageUrl = URL(string: dogApiResponse.message)
                    print("JSON: \(dogApiResponse)")
                }
                
            }
        }
            
            
    }
    
    /// Async function that uses the same API
    /// more info - https://developer.apple.com/videos/play/wwdc2021/10095/
    func fetchData(_ label: String) async throws -> DogApiResponse {
        guard let url else {
            print("Invalid url: \(apiUrl)!")
            throw DogsApiError.invalidUrl
        }
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders =
        ["Authorization": "Bearer some-token"]
        config.timeoutIntervalForRequest = 30
        
        let urlRequest = URLRequest(url: url)
        // how to change the http method of a request
//        urlRequest.httpMethod = .post
        
        let (data, response) = try await URLSession(configuration: config).data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw DogsApiError.invalidResponseCode
        }
        
        let jsonDecoder = JSONDecoder()
        let dogApiResponse = try jsonDecoder.decode(DogApiResponse.self, from: data)
        
        print("Run [\(label)] has finished!")

        return dogApiResponse        
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

enum DogsApiError: Error {
    case invalidResponseCode
    case unableToParse
    case invalidUrl
}

#Preview {
    ContentView()
}
