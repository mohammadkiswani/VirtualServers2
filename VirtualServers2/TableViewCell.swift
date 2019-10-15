//
//  TableViewCell.swift
//  VirtualServers2
//
//  Created by Mohamed on 10/7/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var dwonButton: UIButton!
    @IBOutlet private weak var viewFirst: UIView!
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var viewCell1: TableViewCell!
    @IBOutlet weak var poolNumber: UILabel!
    @IBOutlet weak var versionNumber: UILabel!
    @IBOutlet weak var idNumber: UILabel!
    
    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = view.frame.size.width / 200
        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        view.layer.shadowOpacity = 1.0
        view.layer.cornerRadius = 5.0
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        redView.layer.cornerRadius = redView.frame.size.height / 20
        dwonButton.layer.cornerRadius = frame.size.height / 60
    }
}


