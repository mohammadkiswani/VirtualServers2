//
//  ViewController.swift
//  VirtualServers2
//
//  Created by Mohamed on 10/3/19.
//  Copyright © 2019 Mohamed. All rights reserved.

// MARK: Struct

import UIKit

final class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet private weak var allDev: UIButton!
    @IBOutlet private weak var shadowLabel: UIView!
    @IBOutlet private weak var filterButton: UIButton!
    @IBOutlet private weak var virtualServesTable: UITableView!
    @IBOutlet private weak var ishuesLabel: UILabel!
    
    //    MARK: Variable
    private let netWorkingClient = netWorking()
    var dataArray: virtualServerApiJson?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
        virtualServesTable.separatorColor = UIColor .init(displayP3Red: 249, green: 249, blue: 249, alpha: 0.5)
            allDev.backgroundColor = UIColor.init(displayP3Red: 83/255 , green: 93/255 , blue: 115/255, alpha: 1)
            allDev.setTitleColor(.white, for: .normal)
            allDev.layer.cornerRadius = filterButton.frame.size.height / 2
            shadowLabel.layer.shadowColor = UIColor.lightGray.cgColor
            shadowLabel.layer.shadowRadius = 10.0
            shadowLabel.layer.shadowOpacity = 7.0
            shadowLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            shadowLabel.layer.masksToBounds = false
            ishuesLabel.layer.shadowOffset = CGSize(width: 1, height: 20.0)
            ishuesLabel.layer.shadowOpacity = 3.0
            ishuesLabel.layer.cornerRadius = 3.0
            ishuesLabel.layer.masksToBounds = false
            ishuesLabel.layer.shadowRadius = 40.0
            ishuesLabel.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    // MARK: IBAction
    @IBAction private func allDevicesButton(_ sender: UIButton) {
        if  sender.tag == 0 {
            filterButton.backgroundColor = UIColor.init(displayP3Red: 83/255 , green: 93/255 , blue: 115/255, alpha: 1)
            filterButton.setTitleColor(.white, for: .normal)
            allDev.backgroundColor = .clear
            allDev.setTitleColor(.gray, for: .normal)
            filterButton.layer.cornerRadius = filterButton.frame.size.height / 2
            
        } else if sender.tag == 1 {
            allDev.backgroundColor = UIColor.init(displayP3Red: 83/255 , green: 93/255 , blue: 115/255, alpha: 1)
            filterButton.backgroundColor = .clear
            allDev.setTitleColor(.white, for: .normal)
            filterButton.setTitleColor(.gray, for: .normal)
            allDev.layer.cornerRadius = allDev.frame.size.height / 2
        }
    }
    private func getJson() {
        guard let urlTolExcute =  URL(string: "http://www.mocky.io/v2/5d95dd6433000079972f8d25")else {
            return
        }
        netWorkingClient.execute(_url: urlTolExcute){ (data , Error) in
            self.dataArray = data
            print(self.dataArray ?? 0)
            self.virtualServesTable.reloadData()
        }
    }
}

// MARK:  extension
extension  ViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.content.count ?? 0   }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = virtualServesTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        let item = dataArray!.content[indexPath.row]
        print(item.id)
        cell.idNumber.text = String(item.id)
        cell.poolNumber.text = String(item.name)
        cell.versionNumber.text = String(item.country)
        return cell
    }
}
