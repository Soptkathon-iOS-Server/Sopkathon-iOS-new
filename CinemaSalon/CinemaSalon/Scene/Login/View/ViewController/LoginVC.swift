//
//  LoginVC.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        setButtons()
        setNavigationBar()
    }
    func setNavigationBar() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
    func setButtons() {
        
        for i in 0..<textFields.count {
            
            textFields[i].backgroundColor = UIColor.salonColor(.darkGrayColor)
            textFields[i].layer.cornerRadius = 15
            textFields[i].layer.borderWidth = 1
            textFields[i].layer.borderColor = UIColor.salonColor(.grayColor).cgColor
            textFields[i].clipsToBounds = true
            textFields[i].textColor = UIColor.white
            textFields[i].setLeftPaddingPoints(10)
            
            textFields[0].attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            textFields[1].attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            textFields[1].isSecureTextEntry = true
        }
        
        guard let btn = loginButton else { return }
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.layer.backgroundColor = UIColor.salonColor(.redColor).cgColor
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        
        loginButton = btn
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let dVC = sb.instantiateViewController(identifier: "naviVC")
        dVC.modalPresentationStyle = .fullScreen
        present(dVC, animated: true)
        
        
    }
    
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
