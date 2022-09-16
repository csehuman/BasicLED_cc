//
//  ViewController.swift
//  BasicLEDApp
//
//  Created by Paul Lee on 2022/09/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ledLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingVC = segue.destination as? SettingViewController {
            settingVC.delegate = self
            settingVC.ledText = ledLabel.text ?? ""
            settingVC.textColor = ledLabel.textColor
            settingVC.backgroundColor = view.backgroundColor ?? .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ledLabel.textColor = .yellow
    }
}

extension ViewController: LEDBoardSettingDelegate {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        ledLabel.text = text ?? ""
        ledLabel.textColor = textColor
        view.backgroundColor = backgroundColor
    }
}
