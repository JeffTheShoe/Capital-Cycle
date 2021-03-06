//
//  UserNavigationController.swift
//  Capital Cycle
//
//  Created by Caden Kowalski on 8/16/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit

class UserNavigationController: UINavigationController {

    // MARK: View Instantiation
    
    // Runs when the view is loaded for the first time
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    // MARK: Setup
    
    // Sets up the Navigation Controller
    func setUpNavigationController() {
        self.presentationController?.delegate = self.topViewController as! VerifyUser
    }
}
