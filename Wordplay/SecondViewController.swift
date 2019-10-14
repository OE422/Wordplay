//
//  SecondViewController.swift
//  Wordplay
//
//  Created by  on 10/10/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var fullStatement = UILabel()
    var place2go: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullStatement.text = "My uncle wants to go to the \(place2go!)."
        fullStatement.textAlignment = NSTextAlignment.center
        fullStatement.sizeToFit()
        fullStatement.frame.origin = CGPoint(x: (UIScreen.main.bounds.width/2)-((fullStatement.frame.maxX-fullStatement.frame.minX)/2), y: 180)
        view.addSubview(fullStatement)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    }
}
