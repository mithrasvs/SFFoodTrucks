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

        mapBtn.addTarget(self, action: #selector(flipVC), for: .touchUpInside)
    }

    @objc func flipVC(){
        
//        let mapVC = MapViewController.init(nibName: "MapViewController", bundle: nil)
//
//        let transition = CATransition()
//        transition.duration = 0.3
//        transition.type = CATransitionType(rawValue: "mapVC")
//        transition.subtype = CATransitionSubtype.fromLeft
//        navigationController?.view.layer.add(transition, forKey: kCATransition)
////        navigationController?.pushViewController(mapVC, animated: false)
//
//        navigationController?.popViewController(animated: false)
        
        
        
        UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            self.navigationController?.popViewController(animated: false)
        }, completion: nil)
        
        
    }

}
