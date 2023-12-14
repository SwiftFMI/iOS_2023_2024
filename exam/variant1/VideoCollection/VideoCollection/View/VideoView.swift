//
//  VideoView.swift
//  VideoCollection
//
//  Created by Emil Atanasov on 12/14/23.
//

import SwiftUI
import AVKit
import Combine

struct VideoView: View {
    var video: Video
    @State private var player: AVPlayer
    @State var observer: PlayerTimeObserver
    
    init(video: Video) {
        self.video = video
        let p = AVPlayer(url: video.videoFileUrl!)
        self.player = p
        self.observer = PlayerTimeObserver.init(player: p)
        
        
        //seek to
        let seconds = 10.0 // calculate base on the video duration
        let to = CMTime(seconds: seconds, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        p.seek(to: to)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VideoPlayer(player: player) {
                }
                .frame(height: 300)
                Text("Video description")
            }
        }
        .onReceive(observer.publisher, perform: { value in
            print("value \(value)")
        })
        
    }
}

//https://gist.github.com/ChrisMash/29da1048ead47913ef4b30d248e7ddd2
class PlayerTimeObserver {
  let publisher = PassthroughSubject<TimeInterval, Never>()
  private var timeObservation: Any?
  
  init(player: AVPlayer) {
    // Periodically observe the player's current time, whilst playing
    timeObservation = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: nil) { [weak self] time in
      guard let self = self else { return }
      // Publish the new player time
      self.publisher.send(time.seconds)
    }
  }
}

#Preview {
    VideoView(video: Video.mock)
}
