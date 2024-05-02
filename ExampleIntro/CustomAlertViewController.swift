//
//  CustomAlertView.swift
//  ExampleIntro
//
//  Created by Diego on 18/12/23.
//

import UIKit
import SnapKit

class CustomAlertView: UIVisualEffectView {
    
    var actionLeftHandler: (() -> Void)?
    var actionRightHandler: (() -> Void)?

    private let viewAlert: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()

    private let titleLbl: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()

    private let descriptionLbl: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()

    private let viewActionLeft: UIButton = {
        let btn = UIButton()
        btn.layer.borderWidth = 0.3
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()

    private let viewActionRight: UIButton = {
        let btn = UIButton()
        btn.layer.borderWidth = 0.3
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()

    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        setupUI()
    }

    private func setupUI() {
        
        let blurEffect = UIBlurEffect(style: .dark)
        effect = blurEffect
        contentView.addSubview(viewAlert)
        viewAlert.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(30)
        }

        viewAlert.addSubview(titleLbl)
        viewAlert.addSubview(descriptionLbl)
        viewAlert.addSubview(viewActionLeft)
        viewAlert.addSubview(viewActionRight)

        titleLbl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(30)
        }

        descriptionLbl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
        }

        viewActionLeft.snp.makeConstraints { make in
            make.top.equalTo(descriptionLbl.snp.bottom).offset(30)
            make.bottom.equalToSuperview().inset(-1)
            make.leading.equalToSuperview().inset(-1)
            make.height.equalTo(48)
            make.width.equalToSuperview().multipliedBy(0.51)
        }

        viewActionRight.snp.makeConstraints { make in
            make.top.equalTo(descriptionLbl.snp.bottom).offset(30)
            make.bottom.equalToSuperview().inset(-1)
            make.trailing.equalToSuperview().inset(-1)
            make.height.equalTo(48)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        viewActionLeft.addTarget(nil, action: #selector(leftActionTapped), for: .touchUpInside)
        viewActionRight.addTarget(nil, action: #selector(rightActionTapped), for: .touchUpInside)
        
    }
    
    @objc func leftActionTapped() {
        actionLeftHandler?()
    }

    @objc func rightActionTapped() {
        actionRightHandler?()
    }
    
    func configure(withTitle title: String, description: String, leftActionText: String, rightActionText: String) {
        titleLbl.text = title
        descriptionLbl.text = description
        viewActionLeft.setTitle(leftActionText, for: .normal)
        viewActionRight.setTitle(rightActionText, for: .normal)
    }
}



class ViewControllerV2: UIViewController {
    
    let viewTest : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    
    let customAlertView : CustomAlertView = {
       let view = CustomAlertView()
        view.configure(withTitle: "Gestión cancelada", description: "Tu gestión ha sido cancelada con \n éxito", leftActionText: "Mis gestiones", rightActionText: "Seguir canjeando")
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewTest)
        
        viewTest.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(45)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(200)
        }
        
        view.addSubview(customAlertView)
        customAlertView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        customAlertView.actionLeftHandler = {
            print("customAlertView.actionLeftHandler")
        }
        
        customAlertView.actionRightHandler = {
            print("customAlertView.actionRightHandler")
        }
    }
}
