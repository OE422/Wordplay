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
    var allStacked = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.becomeFirstResponder()
        
        allStacked.alignment = .center
        allStacked.axis = .vertical
        allStacked.distribution = .equalSpacing
        allStacked.spacing = 10
        allStacked.translatesAutoresizingMaskIntoConstraints = false
        allStacked.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        allStacked.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        allStacked.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        allStacked.addArrangedSubview(uncle)
        allStacked.addArrangedSubview(goWhere)
        allStacked.addArrangedSubview(noun)
        allStacked.addArrangedSubview(adjective)
        allStacked.addArrangedSubview(verb)
        allStacked.addArrangedSubview(thirdVCButton)
        view.addSubview(allStacked)
        
        uncle.text = "My uncle wants to go to the..."
        uncle.frame = CGRect(x: 100, y: 100, width: 250, height: 40)
        
        goWhere.delegate = self
        goWhere.frame = CGRect(x: 150, y: 160, width: 150, height: 40)
        goWhere.placeholder = "enter a location"
        goWhere.borderStyle = .roundedRect
        goWhere.autocapitalizationType = .none
        
        noun.delegate = self
        noun.frame = CGRect(x: 150, y: 250, width: 150, height: 40)
        noun.placeholder = "enter a noun"
        noun.borderStyle = .roundedRect
        noun.autocapitalizationType = .none
        
        adjective.delegate = self
        adjective.frame = CGRect(x: 150, y: 300, width: 150, height: 40)
        adjective.placeholder = "enter an adjective"
        adjective.borderStyle = .roundedRect
        adjective.autocapitalizationType = .none
        
        verb.delegate = self
        verb.frame = CGRect(x: 150, y: 350, width: 150, height: 40)
        verb.placeholder = "enter a verb"
        verb.borderStyle = .roundedRect
        verb.autocapitalizationType = .none
        
        thirdVCButton.setTitle("form a sentence", for: .normal)
        thirdVCButton.setTitleColor(.black, for: .normal)
        thirdVCButton.frame = CGRect(x: 150, y: 500, width: 140, height: 40)
        thirdVCButton.addTarget(self, action: #selector(switchToVC3), for: .touchUpInside)
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
        if (textField == noun || textField == adjective || textField == verb)
        {
            if (noun.text != "" && adjective.text != "" && verb.text != "")
            {
                performSegue(withIdentifier: "toThirdVC", sender: self)
            }
        }
        return true
    }

}

