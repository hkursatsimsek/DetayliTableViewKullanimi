//
//  UrunTableViewCell.swift
//  DetayliTableViewKullanimi
//
//  Created by Kürşat Şimşek on 19.12.2021.
//

import UIKit

class UrunTableViewCell: UITableViewCell {
    @IBOutlet weak var urunResimImageView: UIImageView!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var hucreArkaPlan: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
