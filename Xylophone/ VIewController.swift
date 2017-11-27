//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{

  var sounds : [SystemSoundID] = [1, 2, 3, 4, 5, 6, 7]

  override func viewDidLoad() {
    super.viewDidLoad()
    //    From: https://stackoverflow.com/questions/24043904/creating-and-playing-a-sound-in-swift
    // Search for Swift 4 answer
    for index in 0...sounds.count - 1 {
      let fileName : String = "note\(sounds[index])"

      if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "wav") {
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &sounds[index])
      }
    }
  }

  @IBAction func notePressed(_ sender: UIButton) {
    AudioServicesPlaySystemSound(sounds[sender.tag-1])
  }
}

