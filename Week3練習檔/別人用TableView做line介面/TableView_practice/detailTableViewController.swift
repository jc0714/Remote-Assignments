//
//  detailTableViewController.swift
//  TableView_practice
//
//  Created by Hsiao-Han Chi on 2022/7/11.
//

import UIKit

class detailTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let detailCell = "detailCell"
    }
    
    @IBOutlet weak var favoriteButton: UIButton!{
        didSet{
            favoriteButton.configurationUpdateHandler = {
                favoriteButton in favoriteButton.alpha = favoriteButton.isSelected ? 1 : 0.3
                   // 1 : 0.3，代表按鈕在 isSelected 狀態時的透明度是1，normol 狀態時透明度是 0.3
            }
        }
    }
    
    
    @IBOutlet weak var friendButton: UIButton!{
        didSet{
            friendButton.configurationUpdateHandler = {
                friendButton in friendButton.alpha = friendButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var groupButton: UIButton!{
        didSet{
            groupButton.configurationUpdateHandler = {
                groupButton in groupButton.alpha = groupButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var officialButton: UIButton!{
        didSet{
            officialButton.configurationUpdateHandler = {
                officialButton in officialButton.alpha = officialButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet var lineView: [UIView]!
    
    var row = Int()
    
    init?(coder: NSCoder, row: Int){
        self.row = row
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titles = [
    TitleName(name: "我的最愛", number: 34),
    TitleName(name: "好友", number: 524),
    TitleName(name: "群組", number: 49),
    TitleName(name: "官方帳號", number: 112)]
    
    var favoriteLists = [
    List(name: "Mom", words: "", image: "selfie1"),
    List(name: "Brother", words: "", image: "selfie2"),
    List(name: "晟", words: "", image: "selfie3"),
    List(name: "Dad", words: "", image: "selfie4"),
    List(name: "Michael Lin", words: "擁抱人生下個階段～", image: "selfie5"),
    List(name: "小紀", words: "Manners maketh man.", image: "selfie6"),
    List(name: "Hank", words: "You don't have any time to waste.", image: "selfie7"),
    List(name: "阿北北", words: "", image: "selfie8"),
    List(name: "惠兒", words: "", image: "selfie9"),
    List(name: "Milton", words: "(Laugh)", image: "selfie10")]
    
    var friendList = [
    List(name: "Angel", words: "Happy Life", image: "friend1"),
    List(name: "甄", words: "", image: "friend2"),
    List(name: "Irene", words: "", image: "friend3"),
    List(name: "Rhys", words: "習慣不習慣", image: "friend4"),
    List(name: "琪", words: "", image: "friend5"),
    List(name: "Jen", words: "", image: "friend6"),
    List(name: "BoBo", words: "", image: "friend7"),
    List(name: "厭世吉娃娃", words: "厭世人生", image: "friend8"),
    List(name: "Shien", words: "找回重心找回自己", image: "friend9"),
    List(name: "小吳", words: "Pigpig", image: "friend10")]
    
    var groupList = [
    List(name: "建立群組", words: "與好友們建立群組聊天室吧。", image: "group1"),
    List(name: "社群", words: "開團找話題，聊出新麻吉～", image: "group2"),
    List(name: "NZGirls", words: "", image: "group3"),
    List(name: "Python AI人工智慧資料分析", words: "", image: "group4"),
    List(name: "314兄弟姐妹們發大財", words: "", image: "group5"),
    List(name: "2/27會場任務", words: "", image: "group6"),
    List(name: "mis題庫班", words: "", image: "group7"),
    List(name: "35隻熊的家", words: "", image: "group8"),
    List(name: "3QQQQQQQQQ", words: "", image: "group9"),
    List(name: "在紐年青人", words: "New Zealand", image: "group10")]
    
    var officialList = [
    List(name: "一些甜點", words: "歡迎大家加入一些甜點！", image: "official1"),
    List(name: "一膳-台中店", words: "炭燒鰻魚飯四吃", image: "official2"),
    List(name: "中國信託", words: "We are family", image: "official3"),
    List(name: "于塔", words: "", image: "official4"),
    List(name: "克莉斯塔 Christinetart", words: "", image: "official5"),
    List(name: "全家 FamilyMart", words: "成為全家Line好友可享獨家優惠", image: "official6"),
    List(name: "博客來", words: "加入博客來，優惠資訊不漏接！", image: "official7"),
    List(name: "康是美", words: "要美先康是美", image: "official8"),
    List(name: "外交部領事事務局", words: "陪您一起關心旅外安全大小事", image: "official9"),
    List(name: "山威食堂", words: "外帶便當/內用定食，日式食堂", image: "official10")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let getRowNum = row
        if getRowNum == 1{
            titleName.text = "\(titles[0].name)  (\(titles[0].number))"
            favoriteButton.isSelected = true
            friendButton.isSelected = false
            groupButton.isSelected = false
            officialButton.isSelected = false
            lineView[0].isHidden = false
            for i in 1...3{
                lineView[i].isHidden = true
            }
        }else if getRowNum == 2{
            titleName.text = "\(titles[1].name) ( \(titles[1].number))"
            favoriteButton.isSelected = false
            friendButton.isSelected = true
            groupButton.isSelected = false
            officialButton.isSelected = false
            lineView[0].isHidden = true
            lineView[1].isHidden = false
            lineView[2].isHidden = true
            lineView[3].isHidden = true
        }else {
            titleName.text = "\(titles[2].name) ( \(titles[2].number))"
            favoriteButton.isSelected = false
            friendButton.isSelected = false
            groupButton.isSelected = true
            officialButton.isSelected = false
            lineView[0].isHidden = true
            lineView[1].isHidden = true
            lineView[2].isHidden = false
            lineView[3].isHidden = true
        }
 

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //設定cell的Identifier並轉型為detailTableViewCell，以使用宣告的property
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.detailCell, for: indexPath) as! detailTableViewCell
        //宣告property儲存從首頁傳來的row值
        let getRowNum = row
        
        //根據row的值設定對應要顯示的Array資料
        if getRowNum == 1{
            cell.profileImageView.image = UIImage(named: favoriteLists[indexPath.row].image)
            cell.nameLabel.text = favoriteLists[indexPath.row].name
            cell.wordsLabel.text = favoriteLists[indexPath.row].words
        }else if getRowNum == 2{
            cell.profileImageView.image = UIImage(named: friendList[indexPath.row].image)
            cell.nameLabel.text = friendList[indexPath.row].name
            cell.wordsLabel.text = friendList[indexPath.row].words
        }else{
            cell.profileImageView.image = UIImage(named: groupList[indexPath.row].image)
            cell.nameLabel.text = groupList[indexPath.row].name
            cell.wordsLabel.text = groupList[indexPath.row].words
        }
        

        // Configure the cell...

        return cell
    }
    

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
