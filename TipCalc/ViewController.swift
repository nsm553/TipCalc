//
//  ViewController.swift
//  TipCalc
//
//  Created by Sanampudi, Manohar on 3/5/17.
//  Copyright © 2017 Sanampudi, Manohar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("loading view...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let tipPcnt = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPcnt[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func pcntChanged(_ sender: Any) {
        calcTip(sender)
    }  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let userPrefs = UserDefaults.standard
        self.tipControl.selectedSegmentIndex = userPrefs.integer(forKey: "defTipIndx")
        calcTip(animated)
    }
    
}

