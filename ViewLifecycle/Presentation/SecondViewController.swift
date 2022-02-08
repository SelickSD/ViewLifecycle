//
//  SecondViewController.swift
//  ViewLifecycle
//
//  Created by Саидов Тимур on 07.02.2022.
//

import UIKit

final class SecondViewController: UIViewController {
    
    var closure: (() -> Void)? 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
