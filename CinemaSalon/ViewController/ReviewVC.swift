//
//  ReviewVC.swift
//  CinemaSalon
//
//  Created by 최영재 on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ReviewVC: UIViewController {
    
    @IBOutlet weak var ReviewTableView: UITableView!
    @IBOutlet weak var movieImage: UIImageView!
    
    
    let questions: [String] = [
        "주인공과 비슷한 경험을 한 적이 있나요?",
        "영화의 엔딩이 마음에 드나요?",
        "이 영화가 던지는 메세지가 무엇인가요?"
    
    ]

    override func viewDidLoad() {
        ReviewTableView.dataSource = self
        ReviewTableView.delegate = self
        setNavigationBar()
        
   
        movieImage.layer.cornerRadius = 30
        
        super.viewDidLoad()
     
    }
    

    
    func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
}

extension ReviewVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier) as? ReviewCell else {return UITableViewCell()}
        cell.question.text = questions[indexPath.section]
        
        return cell
    }
    
}

extension ReviewVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 191
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


