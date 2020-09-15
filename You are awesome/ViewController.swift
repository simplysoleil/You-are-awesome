//
//  ViewController.swift
//  You are awesome
//
//  Created by Soleil Rain on 9/2/20.
//  Copyright © 2020 Soleil Rain. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 9
    let totalNumberOfSounds = 6
    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription)COULD NOT INITIALIZE")
            }
        } else {
            print("ERROR: COULD NOT READ DATA FROM FILE SOUND0")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
                newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fabulous!",
                        "When the genius bar needs help, they call you!",
                        "Fabulous, That's You!",
                        "You've got the dessign skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds-1)
        if playSoundSwitch.isOn {
            playSound(name: "sound\(soundNumber)")
        }
}
    @IBAction func playSound(_ sender: UISwitch) {
        // do not try to stop audioPlayer if audioPlayer is still nil
        if !sender.isOn && audioPlayer != nil  { // if .isOn is NOT true
                audioPlayer.stop () // stop playing
    }
    
}
}
