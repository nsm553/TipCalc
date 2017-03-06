//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Sanampudi, Manohar on 3/5/17.
//  Copyright © 2017 Sanampudi, Manohar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaulttipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userPrefs = UserDefaults.standard
        self.defaulttipControl.selectedSegmentIndex = userPrefs.integer(forKey: "defTipIndx")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func changeDefault(_ sender: Any) {
        
        let userPrefs = UserDefaults.standard
        let tipIndx = defaulttipControl.selectedSegmentIndex

        userPrefs.set(tipIndx, forKey: "defTipIndx")

        userPrefs.synchronize()
    }

}
