//
//  ViewController.swift
//  Localizable
//
//  Created by Rath! on 12/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let labelHello = UILabel()
    let labelGoodBye = UILabel()
    let button = UIButton()
    let stack = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        didTappedButton()
    }
    
    func setupUI(){
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
        stack.addArrangedSubview(labelHello)
        stack.addArrangedSubview(labelGoodBye)
        stack.addArrangedSubview(button)
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        stack.alignment = .center
        stack.setCustomSpacing(50, after: labelGoodBye)
        
        NSLayoutConstraint.activate([
            
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            // ===
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    @objc func didTappedButton(){
        
        if UserDefaults.standard.string(forKey: "language") == "en" {
            UserDefaults.standard.setValue("km", forKey: leng)
        }else{
            UserDefaults.standard.setValue("en", forKey: leng)
        }
        
        button.setTitle("change".localizeString(), for: .normal)
        labelHello.text =  "greeting".localizeString()
        labelGoodBye.text = "farewell".localizeString()
    }
}



//=====================================================================================================


let leng = "language"

func setLanguage(langCode: String) {
    UserDefaults.standard.setValue(langCode, forKey: leng)
}

extension String {
    func localizeString() -> String {
        let lang = UserDefaults.standard.string(forKey: leng)
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


// --> Select Project at the top left
// --> Select Project
// --> Add Langluage
// --> Create file String File (Legacy)
// --> Click Localizable and then add localizable
