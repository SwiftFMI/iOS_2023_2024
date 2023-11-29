//
//  HomeScreenViewModel.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import Foundation

struct Ad {
    var image: String
    var title: String
    var id: Int
}

extension Ad: Hashable {
    
}

extension Ad {
    var description: String {
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget enim volutpat, euismod justo eget, sollicitudin metus. Sed interdum dui nec vehicula faucibus. Integer purus nulla, vehicula eu nisl nec, laoreet pulvinar eros. Duis id mauris sit amet lorem congue mattis vitae sed libero. Duis vulputate dolor purus, vitae dignissim diam facilisis a. Curabitur lacinia mi nulla, eu accumsan ex imperdiet id. Nam ut viverra lacus. Quisque orci nisi, mollis quis porta id, dignissim ut libero. In ultricies at orci quis luctus. Morbi ut urna elit. Nulla nec enim feugiat, finibus mi ut, egestas orci. Nulla luctus in diam eget ultricies. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;
        
        Ut in risus et eros sagittis lacinia. Donec at velit ac velit bibendum maximus. Integer sed viverra dui. Nullam cursus faucibus semper. Aenean euismod tellus ut vestibulum venenatis. Nulla at sapien id leo finibus gravida. Cras varius pulvinar ipsum, non elementum libero. Duis leo est, suscipit ac odio quis, fermentum vestibulum justo. Sed a pharetra arcu. Cras elementum nisl semper mollis euismod. Etiam mollis dapibus turpis vel consectetur. Nam vel quam ac urna tincidunt eleifend et vitae metus. Phasellus cursus sollicitudin facilisis. Maecenas turpis augue, venenatis eu odio sed, venenatis fringilla tellus. Nullam at purus nec quam mattis lacinia. Sed a quam congue, ultricies magna quis, rhoncus nulla.
        
        """
    }
}

extension Ad {
    static var allAds: [Ad] {
        [
            Ad(image: "house", title: "Продава къща на колела", id: 102),
            Ad(image: "figure.pool.swim", title: "Продава басейн", id: 103),
            Ad(image: "iphone.gen1", title: "Продава телефон", id: 104),
            Ad(image: "house", title: "Продава къща на колела", id: 112),
            Ad(image: "figure.pool.swim", title: "Продава басейн", id: 113),
            Ad(image: "iphone.gen1", title: "Продава телефон", id: 114)
        ]
    }
    
    static var mock: Ad {
        Ad(image: "house", title: "Продава къща на колела", id: 1024)
    }
}

class HomeScreenViewModel: ObservableObject {
    @Published var path: [Ad] = []
    @Published var ads: [Ad] = []
    private var hasBeenInitialized = false
    
    func loadAllAds() {
        if hasBeenInitialized {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            // code to execute
            self?.ads.append(contentsOf: Ad.allAds)
            self?.hasBeenInitialized = true
        })
    }
    
    func reset() {
        hasBeenInitialized = false
        ads = []
    }
    
    func add(ad: Ad) {
        self.ads.append(ad)
    }
    
    func removeAd(indexSet: IndexSet) {
        self.ads.remove(atOffsets: indexSet)
    }
    
    func goToHome() {
        path.removeAll()
    }
}
