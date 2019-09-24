//
//  ViewController.swift
//  SecretCode
//
//  Created by Mike Spears on 2019-09-24.
//  Copyright © 2019 Mike Spears. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var onOff: UISwitch!
    @IBOutlet weak var segmented: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0.0
        sliderLabel.text = "\(slider.value)"
        onOff.isOn = false
        segmented.selectedSegmentIndex = 0
        
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderValueChanged(_ sender: Any) {
        sliderLabel.text = "\(Int(slider.value * 10.0))"
    }
    
    
    @IBAction func checkAction(_ sender: Any) {
    }
}

