//
//  IconRightTextField.swift
//  ExampleIntro
//
//  Created by Diego on 10/12/23.
//

import Foundation
import UIKit

// Use
/**
 import UIKit
 import SnapKit

 class ViewController: UIViewController {

     let searchTXT : IconRightTextField = {
         let txt = IconRightTextField()
         txt.setCustomIcon(UIImage(systemName: "magnifyingglass"))
         return txt
     }()
     
     // life cycle
     override func viewDidLoad() {
         super.viewDidLoad()
         setupUI()
     }
     
     func setupUI() {
         view.backgroundColor = .white
         
         view.addSubview(searchTXT)
         
         searchTXT.snp.makeConstraints { make in
             make.height.equalTo(44)
             make.horizontalEdges.equalToSuperview().inset(20)
             make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
         }
     }
     
 }
 */

class IconRightTextField: UITextField {
    
    var textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        layer.cornerRadius = 5
        layer.borderWidth = 0.8
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = UIColor.white
        font = UIFont.systemFont(ofSize: 16)
    }
    
    func setCustomIcon(_ icon: UIImage? = nil) {
        let iconImageView = UIImageView(image: icon)
        iconImageView.contentMode = .center
        
        iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
        
        rightView = iconImageView
        rightViewMode = .always
    }
}
