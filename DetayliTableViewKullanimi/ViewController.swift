//
//  ViewController.swift
//  DetayliTableViewKullanimi
//
//  Created by Kürşat Şimşek on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListe = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
        let u1 = Urunler(urunId: 1, urunAd: "Macbook Pro 14", urunResimAd: "bilgisayar", urunFiyat: 40000.0)
        let u2 = Urunler(urunId: 2, urunAd: "Rayban Club Master", urunResimAd: "gozluk", urunFiyat: 1500.0)
        let u3 = Urunler(urunId: 3, urunAd: "Sony ZX Series", urunResimAd: "kulaklik", urunFiyat: 1600.0)
        let u4 = Urunler(urunId: 4, urunAd: "Gio Armani", urunResimAd: "parfum", urunFiyat: 2000.0)
        let u5 = Urunler(urunId: 5, urunAd: "Casio X Series", urunResimAd: "saat", urunFiyat: 799.0)
        let u6 = Urunler(urunId: 6, urunAd: "Dyson V8", urunResimAd: "supurge", urunFiyat: 3200.0)
        let u7 = Urunler(urunId: 7, urunAd: "Iphone 13", urunResimAd: "telefon", urunFiyat: 21500.0)
        
        urunlerListe.append(u1)
        urunlerListe.append(u2)
        urunlerListe.append(u3)
        urunlerListe.append(u4)
        urunlerListe.append(u5)
        urunlerListe.append(u6)
        urunlerListe.append(u7)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, HucreProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListe.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunHucre", for: indexPath) as! UrunTableViewCell
        
        cell.urunResimImageView.image = UIImage(named: urun.urunResimAd!)
        cell.urunAdLabel.text = urun.urunAd!
        cell.urunFiyatLabel.text = "\(urun.urunFiyat!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.hucreArkaPlan.layer.cornerRadius = 10.0
        
        cell.hucreProtokol = self // hucreProtokol yetkisini bu hucreye veriyoruz
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let urun = sender as? Urunler
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.urun = urun
        }
    }
    
    func buttonTiklandi(indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        print("\(urun.urunAd!) sepete Eklendi")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListe[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            print("\(urun.urunAd!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") { contextualAction, view, bool in
            print("\(urun.urunAd!) düzenlendi.")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
}

