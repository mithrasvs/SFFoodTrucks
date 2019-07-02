//
//  ListViewController.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    
    @IBOutlet weak var mapBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List View"
        navigationItem.hidesBackButton = true
        mapBtn.addTarget(self, action: #selector(flipVC), for: .touchUpInside)
    }

    @objc func flipVC(){
        UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            self.navigationController?.popViewController(animated: false)
        }, completion: nil)
    }

}
