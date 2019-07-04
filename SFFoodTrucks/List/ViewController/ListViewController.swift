//
//  ListViewController.swift
//  SFFoodTrucks
//
//  Created by Mithra Singam on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit
import Foundation

class ListViewController: UIViewController {
    
    private let presenter = ListViewPresenter()
    private let kCellReUsableIdentifier = "truckInfoCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Food Trucks"
        
        let mapViewBtn = UIBarButtonItem.init(title: "Map", style: .plain, target: self, action: #selector(flipToMapView))
        mapViewBtn.tintColor = .white
        navigationItem.rightBarButtonItem = mapViewBtn
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.register(UINib.init(nibName: "TruckInfoTableViewCell", bundle: nil), forCellReuseIdentifier: kCellReUsableIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        presenter.getFoodTrucksList(didSuccess: { [weak self] message in
            guard let self = self else {return}
                if let infoMessage = message{
                    self.errorMessageLabel.isHidden = false
                    self.errorMessageLabel.text = infoMessage
                }else{
                    self.errorMessageLabel.isHidden = true
                    self.tableView.reloadData()
                }
            }, didFail: { message in
                self.errorMessageLabel.isHidden = false
                self.errorMessageLabel.text = message
        })
    }
    
    @objc private func flipToMapView(){
        let mapViewController = MapViewController.init(nibName: "MapViewController", bundle: nil)
        UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
           self.navigationController?.pushViewController(mapViewController, animated: false)
        }, completion: nil)
    }
}


extension ListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfTableViewRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCellReUsableIdentifier, for: indexPath) as? TruckInfoTableViewCell else {
            return UITableViewCell()
        }
        
        let foodTruckCellData = presenter.getTableViewRowData(forIndex: indexPath.row)
        cell.truckNameLabel.text = foodTruckCellData.foodTruckName
        cell.addressLabel.text = foodTruckCellData.address
        cell.truckSpecialities.text = foodTruckCellData.specialities
        cell.timeLabel.text = foodTruckCellData.timings
        return cell
    }
    
}
