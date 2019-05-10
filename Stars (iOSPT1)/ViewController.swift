//
//  ViewController.swift
//  Stars (iOSPT1)
//
//  Created by Johnny Hicks on 5/9/19.
//  Copyright © 2019 Johnny Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlets and Properties
    @IBOutlet var starNameTextField: UITextField!
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var starsTextView: UITextView!
    
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listStars()
    }
    
    // IBActions and Methods
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else { return }
        
        self.starController.addStar(named: name, withDistance: distance)
        self.listStars()
        self.clearInput()
    }
    
    private func listStars() {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        starsTextView.text = output
    }
    
    private func clearInput() {
        self.starNameTextField.text = ""
        self.distanceTextField.text = ""
    }
}

