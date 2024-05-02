//
//  CustomButtonIcon.swift
//  ExampleIntro
//
//  Created by Diego on 7/12/23.
//

import Foundation
import UIKit


//class ViewController: UIViewController {
//
//    let button = CustomButton()
//    let image = UIImage(systemName: "arrow.down.to.line")!
//    
//    // life cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    func setupUI() {
//        view.backgroundColor = .blue
//        
//        image.withTintColor(.white, renderingMode: .alwaysTemplate)
//        button.configure(title: "Mis gestiones", image: image)
//        
//        view.addSubview(button)
//        button.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(40)
//            make.bottom.equalToSuperview().inset(25)
//            make.height.equalTo(40)
//        }
//       
//    }
//    
//}

class CustomButton: UIButton {
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Public Methods
    
    func configure(title: String, image: UIImage) {
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .red
        layer.cornerRadius = 10
        semanticContentAttribute = .forceRightToLeft
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        roundCorners(corner: 20)
    }
}
