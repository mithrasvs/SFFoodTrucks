//
//  MapViewController.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var listBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        listBtn.addTarget(self, action: #selector(flipVC), for: .touchUpInside)
        
    }

   @objc func flipVC(){
    
    let listVC = ListViewController.init(nibName: "ListViewController", bundle: nil)
//
//    let transition = CATransition()
//    transition.duration = 0.3
//    transition.type = CATransitionType(rawValue: "flip")
//    transition.subtype = CATransitionSubtype.fromLeft
//    navigationController?.view.layer.add(transition, forKey: kCATransition)
//    navigationController?.pushViewController(listVC, animated: false)
    
    
    
    UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
        self.navigationController?.pushViewController(listVC, animated: false)
    }, completion: nil)
        
    }

}
