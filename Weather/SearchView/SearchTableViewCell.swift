//
//  SearchTableViewCell.swift
//  Weather
//
//  Created by manish yadav on 3/25/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var dataModel: SearchModel? {
        didSet {
            setData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setData() {
        self.cityLabel.text = self.dataModel?.name
        self.temperatureLabel.text = "\(self.dataModel?.main.temp ?? 0.0)"
    }
}
