//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Taylor Hansen on 22/01/2017.
//  Copyright © 2017 Taylor Hansen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
// MARK: Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var awesomeImage: UIImageView!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
    
    var lastIndex = -1
    var lastImage = -1
    var lastSound = -1
    let numOfImages = 6
    let numOfSounds = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func playSound(soundName: String) {
       // Dont need this anymore: var soundName = "sound" + String(arc4random_uniform(UInt32(numOfSounds)))
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file")
            }
            
            
    } else {
            print("ERROR: Could not load data from file \(soundName)")
    }
    
    }
    
    func nonRepeatedRandom(last: inout Int, range: Int) -> Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        
        while random == last {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        last = random
        
        return random
        
    }
    
       // MARK: Actions
        
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
    
        if soundSwitch.isOn == false {
            if lastSound != -1 {
                awesomePlayer.stop()
            }
        }
    }
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "I can't wait to use my app!",
                        "You are da Bomb"]
        var random: Int
        
        random = nonRepeatedRandom(last: &lastIndex, range: messages.count)
        messageLabel.text = messages[random]

        awesomeImage.isHidden = false
        random = nonRepeatedRandom(last: &lastImage, range: numOfImages)
        awesomeImage.image = UIImage(named: "image" + String(random))

        


        random = nonRepeatedRandom(last: &lastSound, range: numOfSounds)
        if soundSwitch.isOn {
            playSound(soundName: "sound" + String(random))
            
        }
        
        
        
        
        
        
        
        
        // the code for making sure sounds aren't repeated follows
       // while randomSound == lastSound {
        //    randomSound = Int(arc4random_uniform(UInt32(numOfSounds)))
      //      playSound(soundName: "sound" + String(random))

   
        
        
        
        // var randomIndex: Int = Int(arc4random_uniform(UInt32(messages.count)))
        //  var randomImage: Int = Int(arc4random_uniform(UInt32(numOfImages)))
        // var randomSound: Int = Int(arc4random_uniform(UInt32(numOfSounds)))
        
        /*
        messageLabel.text = messages[index]
       
        if index == messages.count - 1 {
            index = 0
        } else {
            index = index + 1
        }
        
        */
        
        
        /*
        let message1 = "You Are Fantastic!!!"
        let message2 = "Your Are Great!"
        let message3 = "You Are Amazing!"
        
        if messageLabel.text == message1 {
            messageLabel.text = message2
        } else if messageLabel.text == message2 {
            messageLabel.text = message3
        } else {
            messageLabel.text = message1
        }
 */
        

        
        }
}
