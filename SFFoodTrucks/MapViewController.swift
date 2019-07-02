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

        
        title = "Map View"
        
        listBtn.addTarget(self, action: #selector(flipVC), for: .touchUpInside)
        
    }

   @objc func flipVC(){
    
    let listVC = ListViewController.init(nibName: "ListViewController", bundle: nil)
    
    UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
        self.navigationController?.pushViewController(listVC, animated: false)
    }, completion: nil)
        
    }

}
