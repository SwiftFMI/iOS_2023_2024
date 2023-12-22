//
//  ContentViewController.swift
//  Persistance
//
//  Created by Emil Atanasov on 12/19/23.
//

import Foundation
import KeychainStored

class ContentViewModel: ObservableObject {
    @Published var username: String?
    private let USERNAME_KEY = "my.app.username.key"
    @KeychainStored(service: SERVICE_ID) var password: String?
    
    func store(username: String, password: String) {
        self.username = username
        UserDefaults.standard.setValue(username, forKey: USERNAME_KEY)
        self.password = password
    }
    
    func load() {
        if let username = UserDefaults.standard.string(forKey: USERNAME_KEY) {
            self.username = username
        }
        print(password?.count ?? "No active user!")
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: USERNAME_KEY)
        UserDefaults.standard.removeObject(forKey: LOCATION_KEY )
        self.username = nil
    }
    
    func saveData() {
        print("Temp dir => ", FileManager.default.temporaryDirectory)
        
        let myData = "Hello files!"
        let data = myData.data(using: .utf8)
        let url = FileManager.default.temporaryDirectory.appending(path: "my.file.txt")
        do {
            try data?.write(to: url)
        } catch {
            print("Unable to save! \(error)")
        }
        
    }
    
    func loadData() {
        print("Temp dir => ", FileManager.default.temporaryDirectory)
        
        
        let url = FileManager.default.temporaryDirectory.appending(path: "my.file.txt")
        print("URL => \(url.path() )")
        if FileManager.default.fileExists(atPath: url.path()) {
            if let data = FileManager.default.contents(atPath: url.path()) {
                if let str = String(data: data, encoding: .utf8) {
                    print("File content: \(str)")
                }
            } else {
                print("No file content!")
            }
        } else {
            print("File doesn't exist!")
        }
        
        
        
    }
}
