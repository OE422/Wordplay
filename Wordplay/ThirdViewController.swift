//
//  ThirdViewController.swift
//  Wordplay
//
//  Created by  on 10/11/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var n1: String?
    var a1: String?
    var v1: String?
    var sentence = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sentence.text = "The \(n1!) is \(a1!) at \(v1!)."
        sentence.textAlignment = NSTextAlignment.center
        sentence.sizeToFit()
        sentence.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((sentence.frame.maxX-sentence.frame.minX)/2), y: 180)
        view.addSubview(sentence)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
