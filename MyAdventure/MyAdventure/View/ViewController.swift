//
//  ViewController.swift
//  MyAdventure
//
//  Created by Cullen Vaughan on 2/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var promptLabel: UILabel!
    
    @IBOutlet weak var optionOneBtn: UIButton!
    
    @IBOutlet weak var optionTwoBtn: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    
    var promptLogic = PromptLogic();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        promptLabel.text = promptLogic.getPrompt(promptLogic.getCurrentCoordinates())
        optionOneBtn.setTitle(promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 0), for: .normal)
        optionTwoBtn.setTitle(promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 1), for: .normal)
    }

    @IBAction func choiceSubmitted(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text!
        
        promptLogic.compareUserChoice(promptLogic.getCurrentCoordinates(), userAnswer)
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        promptLabel.text = promptLogic.getPrompt(promptLogic.getCurrentCoordinates())

        let optionOneTitle = promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 0)
        let optionTwoTitle = promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 1)
        
        optionOneBtn.setTitle(optionOneTitle, for: .normal)
        optionTwoBtn.setTitle(optionTwoTitle, for: .normal)
        
        background.image = UIImage(named: promptLogic.getBackgroundImage())
    }
}

