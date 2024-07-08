//
//  mainTableViewController.swift
//  TableView_practice
//
//  Created by Hsiao-Han Chi on 2022/7/5.
//

import UIKit

class mainTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet var mainTableView: UITableView!
    
    var rowNum = 0
    
    //首頁資料
    var services = [
    Service(name: "貼圖小舖", image: "icon1"),
    Service(name: "主題小舖", image: "icon2"),
    Service(name: "LINE TAXI", image: "icon3"),
    Service(name: "LINE TV", image: "icon4"),
    Service(name: "LINE MUSIC", image: "icon5"),
    Service(name: "LINE GAME", image: "icon6")]
    
    var themes = [
    Theme(name: "小熊維尼（雨過天晴篇）", image: "theme1"),
    Theme(name: "米奇（水彩畫風篇）", image: "theme2"),
    Theme(name: "小熊維尼 by 卡娜赫拉", image: "theme3"),
    Theme(name: "Penguin and Cat Days（簡約白）", image: "theme4"),
    Theme(name: "舒適自然風", image: "theme5"),
    Theme(name: "戴帽熊大", image: "theme6"),
    Theme(name: "軟綿綿可愛小雞（花田篇）", image: "theme7"),
    Theme(name: "時尚白", image: "theme8"),
    Theme(name: "薄荷綠", image: "theme9"),
    Theme(name: "Samenyan", image: "theme10")]
    
    var stickers = [
    Sticker(name: "ㄇㄚˊ幾兔-賣萌大作戰", image: "sticker1"),
    Sticker(name: "來貘，又動了", image: "sticker2"),
    Sticker(name: "LV.35 野生喵喵怪（屬性:職場）", image: "sticker3"),
    Sticker(name: "白爛貓⭐︎特效貼圖⭐︎初登場", image: "sticker4"),
    Sticker(name: "白爛貓 36⭐︎超實用⭐︎", image: "sticker5"),
    Sticker(name: "胖鯊魚鯊西米15調皮搗蛋", image: "sticker6"),
    Sticker(name: "87小兔：厭世北爛日常", image: "sticker7"),
    Sticker(name: "異常激動又麻煩⭐︎爛得“鳥”你 x Betakkuma", image: "sticker8"),
    Sticker(name: "米犬日常 - 呆萌生活篇", image: "sticker9"),
    Sticker(name: "反應過激的貓 第18彈 職場生存貼圖", image: "sticker10")]
    


    
    //collectionView
    var headers = ["服務", "您可能喜歡的主題", "您可能喜歡的貼圖"]
    
    func numberOfSections(in serviceCollectionView: UICollectionView) -> Int {
            return 3
    }
    
    func collectionView(_ serviceCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0{
            return 6
        }else if section == 1{
            return 10
        }else{
            return 10
        }
        
    }
    
    func collectionView(_ serviceCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //轉型
        let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "\(serviceCollectionViewCell.self)", for: indexPath) as! serviceCollectionViewCell
        //設定不同Section對應要顯示的資料內容
        if indexPath.section == 0{
            cell.imageView.image = UIImage(named: services[indexPath.item].image)
            cell.nameLabel.text = services[indexPath.item].name
        }else if indexPath.section == 1{
            cell.imageView.image = UIImage(named: themes[indexPath.item].image)
            cell.nameLabel.text = themes[indexPath.item].name
        }else{
            cell.imageView.image = UIImage(named: stickers[indexPath.item].image)
            cell.nameLabel.text = stickers[indexPath.item].name
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //轉型
        let headerView = serviceCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! headerView
        //設定Header文字
        headerView.header.text = "\(headers[indexPath.section])"
        
        return headerView
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 130 && nameView.alpha != 1{
            nameView.isHidden = false
            nameView.alpha = 0
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
                self.nameView.alpha = 1
            })
        }else if scrollView.contentOffset.y < 130 && nameView.alpha == 1{
            nameView.alpha = 1
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
                self.nameView.alpha = 0
            })
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        serviceCollectionView.collectionViewLayout = generateLayout()
        navigationItem.backButtonTitle = ""
        nameView.isHidden = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    var serviceSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(90), heightDimension: .absolute(90))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(540), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading) //Header內容靠右上對齊
        section.boundarySupplementaryItems = [header]
        return section
        
    }
    
    var themeSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(120), heightDimension: .absolute(180))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(1200), heightDimension: .absolute(210))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    var stickerSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(170))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(1100), heightDimension: .absolute(170))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func generateLayout() -> UICollectionViewLayout{
        UICollectionViewCompositionalLayout { [unowned self] sectionIndex, environment in
            if sectionIndex == 0{
                return self.serviceSection
            }else if sectionIndex == 1{
                return self.themeSection
            }else{
                return self.stickerSection
            }
            
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowNum = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> detailTableViewController? {
        return detailTableViewController(coder: coder, row: rowNum)
    }
    
    
    

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
