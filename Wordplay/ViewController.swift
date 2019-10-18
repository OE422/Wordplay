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
        
        view.addSubview(allStacked)
        allStacked.addArrangedSubview(uncle)
        allStacked.addArrangedSubview(goWhere)
        allStacked.addArrangedSubview(noun)
        allStacked.addArrangedSubview(adjective)
        allStacked.addArrangedSubview(verb)
        allStacked.addArrangedSubview(thirdVCButton)
        
        
        uncle.text = "My uncle wants to go to the..."
        
        goWhere.delegate = self
        goWhere.placeholder = "enter a location"
        goWhere.borderStyle = .roundedRect
        goWhere.autocapitalizationType = .none
        
        noun.delegate = self
        noun.placeholder = "enter a noun"
        noun.borderStyle = .roundedRect
        noun.autocapitalizationType = .none
        
        adjective.delegate = self
        adjective.placeholder = "enter an adjective"
        adjective.borderStyle = .roundedRect
        adjective.autocapitalizationType = .none
        
        verb.delegate = self
        verb.placeholder = "enter a verb"
        verb.borderStyle = .roundedRect
        verb.autocapitalizationType = .none
        
        thirdVCButton.setTitle("form a sentence", for: .normal)
        thirdVCButton.setTitleColor(.black, for: .normal)
        thirdVCButton.addTarget(self, action: #selector(switchToVC3), for: .touchUpInside)
        
        allStacked.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        allStacked.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        allStacked.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
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

