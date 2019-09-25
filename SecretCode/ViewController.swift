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
    
    var secret: Secret!
    var tempMessage : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0.0
        sliderLabel.text = "\(slider.value)"
        onOff.isOn = false
        segmented.selectedSegmentIndex = 0
        secret = Secret.getSavedSecret()
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderValueChanged(_ sender: Any) {
        sliderLabel.text = "\(Int(slider.value * 10.0))"
    }
    
    
    @IBAction func checkAction(_ sender: Any) {
        if let message = secret.checkCode(slider: Int(slider.value * 10.0), isOn: onOff.isOn, segment: segmented.selectedSegmentIndex) {
            tempMessage = message
            performSegue(withIdentifier: "correctSegue", sender: self)
        } else {
            let ac = UIAlertController(title: "Incorrect", message: "Sorry that's the wrong code", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.slider.value = 0.0
                self.sliderLabel.text = "\(self.slider.value)"
                self.onOff.isOn = false
                self.segmented.selectedSegmentIndex = 0
            })
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "correctSegue" {
            if let vc = segue.destination as? CorrectViewController {
                vc.message = tempMessage
            }
        }
    }
}

