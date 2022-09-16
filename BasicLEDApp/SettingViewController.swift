//
//  SettingViewController.swift
//  BasicLEDApp
//
//  Created by Paul Lee on 2022/09/16.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    var ledText = ""
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    var delegate: LEDBoardSettingDelegate?
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == yellowButton {
            changeTextColor(color: .yellow)
        } else if sender == purpleButton {
            changeTextColor(color: .purple)
        } else if sender == greenButton {
            changeTextColor(color: .green)
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == blackButton {
            changeBackgroundColor(color: .black)
        } else if sender == blueButton {
            changeBackgroundColor(color: .blue)
        } else if sender == orangeButton {
            changeBackgroundColor(color: .orange)
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        delegate?.changedSetting(text: textField.text, textColor: textColor, backgroundColor: backgroundColor)
        navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = ledText
        changeTextColor(color: textColor)
        changeBackgroundColor(color: backgroundColor)
    }
    
    private func changeTextColor(color: UIColor) {
        textColor = color
        yellowButton.alpha = color == .yellow ? 1 : 0.2
        purpleButton.alpha = color == .purple ? 1 : 0.2
        greenButton.alpha = color == .green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        backgroundColor = color
        blackButton.alpha = color == .black ? 1 : 0.2
        blueButton.alpha = color == .blue ? 1 : 0.2
        orangeButton.alpha = color == .orange ? 1 : 0.2
    }
}
