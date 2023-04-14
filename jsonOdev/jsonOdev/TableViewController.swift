//
//  TableViewController.swift
//  jsonOdev
//
//  Created by kerem on 14.04.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var carList = [Cars]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        fonksiyonu burda çağırdım.
        fetchData()
        
    }

    
    //MARK: - Bu fonksiyon sayesinde scroll bar ım en üste geldiğinde navigation bar ımın gözükmemesini sağladım.
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = carList[indexPath.row].title
        cell.imageView?.image = UIImage(named: carList[indexPath.row].image_url)
        
       
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .systemGray6
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: headerView.frame.width - 30, height: headerView.frame.height))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.text = "Spor Arabalar"
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
//    header ın yüksekliğini ayarladım.
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
            vc.name = carList[indexPath.row].title
           vc.descriptionText = carList[indexPath.row].description
            vc.image = UIImage(named: carList[indexPath.row].image_url)!
            tableView.deselectRow(at: indexPath, animated: true)
            self.navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    
    }
    
//    MARK: - fetch işlemi yapılması
    
    func fetchData(){
//        belirtilen url e deki uzantılı dosyanın url ini fileLocation a aktarıyoruz
        guard let fileLocation = Bundle.main.url(forResource: "cars", withExtension: "json")
        else{
            return
        }
        do {
//  bu kod fileLocation  dosya yolunda bulunan veriyi okur ve bu veriyi Data tipinde bir nesne olarak döndürür.  yapamazsa  hata fırlatır.
            let data = try Data(contentsOf: fileLocation)
//            decode yöntemi kullanılarak data daki json verileri Cars tipinde bir diziye dönüştürülür yapamazsa hata fırlatır.
            let receivedData = try JSONDecoder().decode([Cars].self, from:  data)
//            Cars tipindeki carList adındaki TableViewController içinde bulunan diziye receivedData dan aktarılır
            self.carList = receivedData
//            table view un güncellenmesi işini arka planda yapılmasını sağlar.
            DispatchQueue.main.async{
//                table view güncellenir.
                self.tableView.reloadData()
            }
        }catch{
            //burda print("hata var") gibi bir mesaj da oluşturabilirdim ama hatayla ilgili daha detaylı bilgi almak için print(error) ı tercih ettim.
            print(error)
        }
    }
}
