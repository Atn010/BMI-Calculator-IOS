//
//  ViewController.swift
//  BMICalculator
//
//  Created by Antonius George on 25/04/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var BMIIndex: UILabel!
    @IBOutlet weak var BMiNote: UILabel!
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var BMITitle: UILabel!
    
    
    var weightValue:Float = 0.0
    var heightValue:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func switchTheme(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            self.view.backgroundColor = UIColor.white
            weightText.textColor = UIColor.black
            heightText.textColor = UIColor.black
            appTitle.textColor = UIColor.black
            BMITitle.textColor = UIColor.black
        }else{
             self.view.backgroundColor = UIColor.black
            weightText.textColor = UIColor.white
            heightText.textColor = UIColor.white
            appTitle.textColor = UIColor.white
            BMITitle.textColor = UIColor.white
        }
    }
    
    func BMICalc(weight:Float, height:Float){
        /*
         
         Underweight = <18.5
         Normal weight = 18.5–24.9
         Overweight = 25–29.9
         Obesity = BMI of 30 or greater
 
         */
        
        //Formula
        let BMI: Float = Float ( weight / ( (height / 100) * (height / 100)))
        
        BMIIndex.text = String(BMI)
        //Show Statement
        if(BMI < 18.5){
            BMIIndex.textColor = UIColor.blue
            BMiNote.text = "Underweight"
            BMiNote.textColor = UIColor.blue
        }else
        if(BMI < 25){
            BMIIndex.textColor = UIColor.green
            BMiNote.text = "Normal"
            BMiNote.textColor = UIColor.green
        }else
        if(BMI < 30){
            BMIIndex.textColor = UIColor.orange
            BMiNote.text = "Overweight"
            BMiNote.textColor = UIColor.orange
        }else
        if(BMI >= 30){
            BMIIndex.textColor = UIColor.red
            BMiNote.text = "Obese"
            BMiNote.textColor = UIColor.red
        }
    }
    

    @IBAction func weightSlider(_ sender: UISlider) {
        weightValue = sender.value
        weightText.text = String(weightValue)
        BMICalc(weight: weightValue, height: heightValue)
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heightValue  = sender.value
        heightText.text = String( heightValue )
        BMICalc(weight: weightValue, height: heightValue)
    }
}

