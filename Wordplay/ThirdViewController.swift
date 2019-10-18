//
//  ThirdViewController.swift
//  Wordplay
//
//  Created by  on 10/11/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {

    var n1: String?
    var a1: String?
    var v1: String?
    var LFW = UITextField()
    var replaceWith = UITextField()
    var replaceWithButton = UIButton()
    var allStacked = UIStackView()
    var sentence = UILabel()
    var tapped = UITapGestureRecognizer()
    let replaceWithAlert = UIAlertController(title: "Replace With Word ", message: "No Word Entered.", preferredStyle: .alert)
    let dismiss = UIAlertAction(title: "OK", style: .default, handler: {
        action in })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        replaceWithAlert.addAction(dismiss)
        tapped.addTarget(self, action: #selector(tappedAfterAlert))
        
        sentence.text = "The \(n1!) is \(a1!) at \(v1!)."
        sentence.textAlignment = NSTextAlignment.center
        sentence.sizeToFit()
        view.addSubview(sentence)
        
        allStacked.alignment = .center
        allStacked.axis = .vertical
        allStacked.distribution = .equalSpacing
        allStacked.spacing = 10
        allStacked.translatesAutoresizingMaskIntoConstraints = false
        allStacked.addArrangedSubview(sentence)
        allStacked.addArrangedSubview(LFW)
        allStacked.addArrangedSubview(replaceWith)
        allStacked.addArrangedSubview(replaceWithButton)
        view.addSubview(allStacked)
        
        LFW.placeholder = "Look For Word"
        LFW.delegate = self
        LFW.borderStyle = .roundedRect
        LFW.autocapitalizationType = .none
        
        replaceWith.placeholder = "Replace With"
        replaceWith.delegate = self
        replaceWith.borderStyle = .roundedRect
        replaceWith.autocapitalizationType = .none
        replaceWith.isHidden = true
        
        replaceWithButton.setTitle("Replace With Word", for: .normal)
        replaceWithButton.setTitleColor(.black, for: .normal)
        replaceWithButton.isHidden = true
        replaceWithButton.addTarget(self, action: #selector(checkForWordSender), for: .touchUpInside)
        
        allStacked.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        allStacked.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        allStacked.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180).isActive = true
        
    }
    @objc func tappedAfterAlert (sender: UITapGestureRecognizer)
    {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        if (textField == LFW)
        {
            checkForWord(arg: LFW)
        }
        if (replaceWith.text != "")
        {
            if (textField == replaceWith)
            {
                checkForWord(arg: replaceWith)
            }
        }
        else
        {
            present(replaceWithAlert, animated: true, completion: nil)
        }
        return true
    }
    @objc func checkForWordSender ()
    {
        if (replaceWith.text != "")
        {
            checkForWord(arg: replaceWith)
        }
        else
        {
            present(replaceWithAlert, animated: true, completion: nil)
        }

    }
    func checkForWord (arg textField: UITextField)
    {
        let wordFound = UIAlertController(title: "Look For Word", message: ":)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.replaceWith.isHidden = false
            self.replaceWithButton.isHidden = false
        })
        wordFound.addAction(okButton)
        
        if (((sentence.text!).contains(textField.text!)))
        {
                wordFound.message = ":)"
        }
        else
        {
            wordFound.message = ":("
        }
        present(wordFound, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
