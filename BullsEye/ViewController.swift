//
//  ViewController.swift
//  BullsEye
//
//  Created by Juan Lizarraga on 9/23/16.
//  Copyright © 2016 Koalaroomie, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider : UISlider! //declaramos la valiarble IBOutlet
    @IBOutlet weak var targetLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*        currentValue = lroundf(slider.value) //le damos el valor del slider a la variable
        targetValue = 1 + Int(arc4random_uniform(100)) // variable con 1 + numero random del 0-99
 */
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController (title: "The value", message: message, preferredStyle: .alert)
        let action  =   UIAlertAction(title: "OK", style: .default,
                                      handler: nil)
        alert.addAction(action)
        present(alert, animated:true, completion:nil)
        startNewRound()
        updateLabels()
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
       }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }
    
}

