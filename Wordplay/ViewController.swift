//
//  ViewController.swift
//  Wordplay
//
//  Created by  on 10/10/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var uncle = UILabel()
    var goWhere = UITextField()
    var noun = UITextField()
    var adjective = UITextField()
    var verb = UITextField()
    var thirdVCButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goWhere.delegate = self
        self.becomeFirstResponder()
        
        uncle.text = "My uncle wants to go to the..."
        uncle.frame = CGRect(x: 100, y: 100, width: 250, height: 40)
        view.addSubview(uncle)
        
        goWhere.frame = CGRect(x: 150, y: 160, width: 150, height: 40)
        goWhere.placeholder = "enter a location"
        goWhere.borderStyle = .roundedRect
        goWhere.autocapitalizationType = .none
        view.addSubview(goWhere)
        
        noun.frame = CGRect(x: 150, y: 250, width: 150, height: 40)
        noun.placeholder = "enter a noun"
        noun.borderStyle = .roundedRect
        noun.autocapitalizationType = .none
        view.addSubview(noun)
        
        adjective.frame = CGRect(x: 150, y: 300, width: 150, height: 40)
        adjective.placeholder = "enter an adjective"
        adjective.borderStyle = .roundedRect
        adjective.autocapitalizationType = .none
        view.addSubview(adjective)
        
        verb.frame = CGRect(x: 150, y: 350, width: 150, height: 40)
        verb.placeholder = "enter a verb"
        verb.borderStyle = .roundedRect
        verb.autocapitalizationType = .none
        view.addSubview(verb)
        
        thirdVCButton.setTitle("form a sentence", for: .normal)
        thirdVCButton.frame = CGRect(x: 150, y: 400, width: 140, height: 40)
        thirdVCButton.addTarget(self, action: #selector(switchToVC3), for: .touchUpInside)
        view.addSubview(thirdVCButton)
    }
    @objc func switchToVC3 (sender: UIButton)
    {
        if (noun.text != "" && adjective.text != "" && verb.text != "")
        {
            performSegue(withIdentifier: "toThirdVC", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSecondVC")
        {
                let displayVC = segue.destination as! SecondViewController
            displayVC.place2go = goWhere.text!
        }
        if(segue.identifier == "toThirdVC")
        {
            let displayVC = segue.destination as! ThirdViewController
            displayVC.n1 = noun.text!
            displayVC.a1 = adjective.text!
            displayVC.v1 = verb.text!
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField == goWhere)
        {
            performSegue(withIdentifier: "toSecondVC", sender: self)
        }
        return true
    }

}

