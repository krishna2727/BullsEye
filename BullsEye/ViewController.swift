//
//  ViewController.swift
//  BullsEye
//
//  Created by fordlabs on 1/24/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentvalue = 0
    var targetvalue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scorelabel:UILabel!
    @IBOutlet weak var roundlabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentvalue = Int(roundedValue)
        startNewGame()
        
    }

    @IBAction func showAlert(){
        
        let difference = abs(targetvalue - currentvalue)
        var points = 100 - difference
        score += points
        
        let title : String
        if difference == 0{
            
            title = "perfect"
            points += 100
        }else if difference < 5{
            title = "you almost had it!"
            points += 50
            
        }else if difference < 10 {
            title = "Pretty good!"
            
        }else {
            title = "not even close..."
        }
        let message = "you scored \(points) points"
        
        
        let alert = UIAlertController(title:"hello, worlds!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated:true,completion: nil )
   
    }

    @IBAction func sliderMoved(_ slider:UISlider){
        
        
        let roundedValue = slider.value.rounded()
        
        currentvalue = Int(slider.value)
    }
    
    func startNewRound(){
        round += 1
        let randomNum:UInt32 = arc4random_uniform(100)
        targetvalue = Int(randomNum)
        currentvalue = 50
        slider.value = Float(currentvalue)
        updatelabels()
    }
    
    func updatelabels(){
        targetLabel.text = String(targetvalue)
        scorelabel.text = String(score)
        roundlabel.text = String(round)
    }
    
   @IBAction func startNewGame() {
       score = 0
       round = 0
        startNewRound()
    }
}

