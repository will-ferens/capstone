//
//  SecondViewController.swift
//  Segues
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit

protocol CanReceive {
    func dataReceived(data : String)
}

class SecondViewController: UIViewController {
    
    var delegate : CanReceive?
    
    var textPassed = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = textPassed
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func passDataBack(_ sender: Any) {
            delegate?.dataReceived(data: textField.text!)
        dismiss(animated: true, completion: nil)
    }
    
   

}
