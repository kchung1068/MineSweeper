//
//  soundManager.swift
//  MineSweeper
//
//  Created by zach calcagno on 5/10/19.
//  Copyright © 2019 Kyle Chung. All rights reserved.
//

import Foundation
import AVFoundation

class soundManager{
    
    var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {

    }
    
    func playSound(_ effect:SoundEffect) {
        
        let soundFileName = " "
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
        
        guard bundlePath != nil else{
            print("Couldn't find sound file \(soundFileName) in the bundle")
            return
        }
        let soundURL = URL(fileURLWithPath: bundlePath!)
        do{
            audioPlayer =  try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
        }
        catch{
            print("Couldn't create the audio player objectt for sound file \(soundFileName)")
        }
        
    }
    
    
}
