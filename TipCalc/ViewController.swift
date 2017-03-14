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
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var pplSlider: UISlider!
    @IBOutlet weak var pplLabel: UILabel!
    @IBOutlet weak var perHeadLabel: UILabel!
    
    let sliderStep : Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("loading view...")
        //tipPercentChanged(tipSlider)
        self.billField.becomeFirstResponder()
        self.navigationController?.navigationBar.tintColor = UIColor.blue
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        calcTip()
    }
    
    
    @IBAction func tipPercentChanged(_ sender: Any) {

        setSliderStep(sender as! UISlider)
        
        let tipPcntValue = Int((sender as! UISlider).value)
        tipPercentLabel.text = "\(tipPcntValue)%"
        calcTip()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear....")
        super.viewWillAppear(animated)

        let userPrefs = UserDefaults.standard
        let defaultTip = userPrefs.float(forKey: "defTipValue")
        tipPercentLabel.text = "\(Int(defaultTip))%"
        self.tipSlider.setValue(defaultTip, animated: true)
        
        calcTip()
    }
    
    @IBAction func changePersons(_ sender: Any) {
        // Per Head Share
        
        setSliderStep(sender as! UISlider)
        
        calcTip()
    }
    
    
    /*
        Utility Functions
    */
    func calcTip()  {
        
        let bill = Double(billField.text!) ?? 0
        let tipPcnt = Int(tipSlider.value)
        
        let tip = bill * Double(tipPcnt)/100.0
        let total = bill + tip
        
        tipLabel.text = formatCurrency(value: tip)
        totalLabel.text = formatCurrency(value: total)
        
        // Per Head Share
        let ppl = Int(pplSlider.value)
        let phShare = total / Double(pplSlider.value)
        
        pplLabel.text = String(format: "%d", ppl)
        perHeadLabel.text = formatCurrency(value: phShare)
    }
    
    /*
     Set Slider to increment in steps of 1
     */
    func setSliderStep(_ sender: UISlider)  {
        let roundedValue = round(sender.value / sliderStep) * sliderStep
        sender.value = roundedValue
    }
    
    func formatCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2;
        formatter.locale = Locale.current
        let result = formatter.string(from: value as NSNumber);
        return result!;
    }

    func setNavBarColors()   {
        UINavigationBar.appearance().barTintColor = UIColor(red: 46.0/255.0, green: 14.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

    }
}

