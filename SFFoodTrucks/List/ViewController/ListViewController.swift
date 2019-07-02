//
//  ListViewController.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List View"
        navigationItem.hidesBackButton = true
        
        let mapViewBtn = UIBarButtonItem.init(title: "Map", style: .plain, target: self, action: #selector(flipToMapView))
        mapViewBtn.tintColor = .white
        
        navigationItem.rightBarButtonItem = mapViewBtn
        
    }

    @objc func flipToMapView(){
        UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            self.navigationController?.popViewController(animated: false)
        }, completion: nil)
    }

}
