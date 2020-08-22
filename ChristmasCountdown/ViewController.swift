//
//  ViewController.swift
//  ChristmasCountdown
//
//  Created by Jakub on 8/19/20.
//  Copyright © 2020 Kazu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var DaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xmasComponents = DateComponents(month: 12, day: 24)
        let nextXmas = Calendar.current.nextDate(after: Date(), matching: xmasComponents, matchingPolicy: .strict)!
        let daysUntilXmas = Calendar.current.dateComponents([.day], from: Date() , to: nextXmas).day!
        
        if daysUntilXmas == 0 {
            DaysLabel.text = "Merry Christmas!"
        }
        else {
            DaysLabel.text = String(daysUntilXmas)
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "jinglebells", ofType: "mp3")!))
        } catch {
            print(error)
        }
        
    }
        // Do any additional setup after loading the view, typically from a nib.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TreeButton(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
        else {
            audioPlayer.play()
        }
    }
}
