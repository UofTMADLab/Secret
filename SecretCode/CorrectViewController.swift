//
//  CorrectViewController.swift
//  SecretCode
//
//  Created by Mike Spears on 2019-09-24.
//  Copyright © 2019 Mike Spears. All rights reserved.
//

import UIKit

class CorrectViewController: UIViewController {

    var message: String!
    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
