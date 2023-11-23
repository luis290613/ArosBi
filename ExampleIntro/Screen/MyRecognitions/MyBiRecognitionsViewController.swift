//
//  MyBiRecognitionsViewController.swift
//  ExampleIntro
//
//  Created by Diego on 15/11/23.
//

import UIKit
import SnapKit

class MyBiRecognitionsViewController: UIViewController {
    
    let totalView = ItemRecognitionView()
    let availableView = ItemRecognitionView()
    let exchangedView = ItemRecognitionView()
    
    let data : [(String,String,String,String)] = [
        ("01/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
        ("13/05/2023" , "Disponible", "Luis Diego Ruiz Bautista", " Excelente desenpeño para nuevos feactures..."),
    ]
    
    
    var titleImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "creditcard")?.withRenderingMode(.alwaysTemplate)
        img.contentMode = .scaleAspectFit
        img.tintColor = .black
        return img
    }()
    
    
    var titleLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Tus reconocimientos"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    
    var recognitionTbl : UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .red
        return tbl
    }()
    
    let emptyView: UIView = {
        let emptyView = UIView()
        
        let img = UIImageView()
        img.image = UIImage(systemName: "creditcard")
        img.contentMode = .scaleAspectFit
        img.tintColor = .black
        
        let lbl = UILabel()
        lbl.text = "No encontramos reconocimientos que \n apliquen a los filtros seleccionados. \n Intenta con Otros"
        lbl.font = UIFont.systemFont(ofSize: 15) //boldSystemFont(ofSize: 16)
        lbl.textColor = .gray
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        
        emptyView.addSubview(img)
        emptyView.addSubview(lbl)
        
        img.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.centerX.equalTo(emptyView.snp.centerX)
            make.centerY.equalTo(emptyView.snp.centerY).offset(-70)
        }
        
        lbl.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(10)
            make.centerX.equalTo(emptyView.snp.centerX)
        }
        
        return emptyView
    }()
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Mis Reconocimientos Bi"
        view.backgroundColor = .white
        // ITems...
        totalView.setupUI(title: "10", description: "Total", colorBack: .blue, colorTitle: .white)
        availableView.setupUI(title: "5", description: "Disponibles", colorBack: .yellow, colorTitle: .black)
        exchangedView.setupUI(title: "5", description: "Canjeados", colorBack: .yellow, colorTitle: .black)
        
        let stackView = UIStackView(arrangedSubviews: [totalView, availableView, exchangedView])
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.backgroundColor = .gray.withAlphaComponent(0.15)
        
        view.addSubview(stackView)
        view.addSubview(titleImg)
        view.addSubview(titleLbl)
        view.addSubview(recognitionTbl)
        
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(120)
        }
        
        titleImg.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(16)
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.height.width.equalTo(25)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.leading.equalTo(titleImg.snp.trailing).offset(16)
            make.centerY.equalTo(titleImg.snp.centerY)
        }
        
        
        
        // Table...
        //recognitionTbl.delegate = self
        recognitionTbl.dataSource = self
        recognitionTbl.backgroundView = emptyView
        recognitionTbl.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        recognitionTbl.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(titleLbl.snp.bottom).offset(18)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
}



extension MyBiRecognitionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let (data, state, title, description) = data[indexPath.row]
        cell.configure(dateCreation: data, state: state, title: title, description: description)
        return cell
    }
    
}

// MARK: - UITableViewCell

class CustomTableViewCell: UITableViewCell {

    let dateCreationStateLbl : UILabel = {
       let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.textColor = UIColor.gray
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    let titleLbl : UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let descriptionLbl : UILabel = {
       let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = UIColor.gray
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder :) has not been implemented")
    }
    
    
    private func setupUI() {
        selectionStyle = .none
        
        [dateCreationStateLbl, titleLbl, descriptionLbl].forEach { addSubview($0) }
        
        dateCreationStateLbl.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(16)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(dateCreationStateLbl.snp.bottom).offset(4)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(16)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(4)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(16)
            make.bottom.equalTo(snp.bottom).offset(-16)
        }
        
    }

    func configure(dateCreation: String, state : String, title: String, description: String) {
        dateCreationStateLbl.text = "\(dateCreation)  |  \(state)"
        titleLbl.text = title
        descriptionLbl.text = description
    }
}


// MARK: - ITEM CUSTOM VIEW

class ItemRecognitionView: UIView {
    
    var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    var descriptionLbl: UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    init() {
        super.init(frame: .zero)
        commonSetup()
    }
    
    func setupUI(title: String, description: String, colorBack: UIColor, colorTitle: UIColor) {
        self.titleLbl.text = title
        self.titleLbl.textColor = colorTitle
        self.descriptionLbl.text = description
        self.titleView.backgroundColor = colorBack
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder :) has not been implemented")
    }
    
    private func commonSetup() {
        addSubview(titleView)
        titleView.addSubview(titleLbl)
        addSubview(descriptionLbl)
        
        titleView.snp.makeConstraints { make in
            make.height.width.equalTo(31)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-15)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(titleView)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(8)
            make.centerX.equalTo(titleView)
        }
    }
}
