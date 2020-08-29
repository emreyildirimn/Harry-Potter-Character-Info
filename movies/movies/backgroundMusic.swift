//
//  backgroundMusic.swift
//  movies
//
//  Created by mac on 28.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import AVFoundation

class bgMusic {
   static func playBgMusic(){
        var AudioPlayer = AVAudioPlayer()
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "harry", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
            }
}
