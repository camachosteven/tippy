//
//  ViewController.swift
//  tippy
//
//  Created by Steven Camacho on 8/2/20.
//  Copyright © 2020 Steven Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var percentageField: UISegmentedControl!
    @IBOutlet weak var peopleField: UISlider!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var personField: UILabel!
    
    var bill = 0.0
    let percentages = [0.1, 0.15, 0.2, 0.25]
    var tip = 0.0
    var total = 0.0
    var people = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.text = ""
        tipField.text = ""
        totalField.text = ""
        personField.text = ""
        peopleField.value = Float(people)
        peopleLabel.text = "\(people)"
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func billChanged(_ sender: Any) {
        calculateTip()
        calculatePerson()
    }
    
    @IBAction func numberOfPeopleUpdated(_ sender: UISlider) {
        people = Int(peopleField.value)
        peopleLabel.text = "\(people)"
        calculatePerson()
    }
    
    
    private func calculateTip() {
        bill = Double(billField.text!) ?? 0
        tip = bill * percentages[percentageField.selectedSegmentIndex]
        total = bill + tip
        tipField.text = "\(String(format: "%.2f", tip))"
        totalField.text = "\(String(format: "%.2f", total))"
    }
    
    private func calculatePerson() {
        let person = total / Double(people)
        personField.text = "\(String(format: "%.2f", person))"
    }
    

}

