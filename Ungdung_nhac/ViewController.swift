//
//  ViewController.swift
//  Ungdung_nhac
//
//  Created by Admin on 8/31/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    

    @IBOutlet weak var Sld_Vol: UISlider!
    @IBOutlet weak var Btn_Play: UIButton!
    
    var audio = AVAudioPlayer()
    var bat_tat = true
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        audio.prepareToPlay()
        addThumbImgForSlider()
    }
    
    func addThumbImgForSlider(){
        Sld_Vol.setThumbImage(UIImage(named:"thumb.png"), forState: .Normal)
        Sld_Vol.setThumbImage(UIImage(named:"thumbHightLight.png"), forState: .Highlighted)
    }

    @IBAction func action_Play(sender: AnyObject) {
        if(bat_tat){
            audio.play()
            bat_tat = false
            Btn_Play.setImage(UIImage(named:"pause.png"), forState: .Normal)
        }else{
            audio.pause()
            bat_tat = true
            Btn_Play.setImage(UIImage(named:"play.png"), forState: .Normal)        }
    }
    @IBAction func sld_Volume(sender: UISlider) {
        print(sender.value)
        audio.volume = sender.value
    }

}

