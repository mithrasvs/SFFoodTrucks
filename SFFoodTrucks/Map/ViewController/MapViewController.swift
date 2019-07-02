//
//  MapViewController.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let listViewBtn = UIBarButtonItem.init(title: "List", style: .plain, target: self, action: #selector(flipToListView))
        listViewBtn.tintColor = .white
        
        navigationItem.rightBarButtonItem = listViewBtn
        
        title = "Map View"
    }

   @objc func flipToListView(){
    
    let listVC = ListViewController.init(nibName: "ListViewController", bundle: nil)
    
    UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
        self.navigationController?.pushViewController(listVC, animated: false)
    }, completion: nil)
        
    }

}
