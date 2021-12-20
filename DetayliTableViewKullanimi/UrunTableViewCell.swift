//
//  UrunTableViewCell.swift
//  DetayliTableViewKullanimi
//
//  Created by Kürşat Şimşek on 19.12.2021.
//

import UIKit

// Her yerden erişilmesi için class'ın üzerinde tanımlıyoruz.
protocol HucreProtocol {
    func buttonTiklandi(indexPath:IndexPath)
}

class UrunTableViewCell: UITableViewCell {
    @IBOutlet weak var urunResimImageView: UIImageView!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var hucreArkaPlan: UIView!
    
    var hucreProtokol:HucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sepeteEkleButton(_ sender: Any) {
        hucreProtokol?.buttonTiklandi(indexPath: indexPath!)
    }
    
}
