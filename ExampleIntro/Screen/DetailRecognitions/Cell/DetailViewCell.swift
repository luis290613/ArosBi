//
//  DetailViewCell.swift
//  ExampleIntro
//
//  Created by Diego on 22/11/23.
//

import Foundation
import UIKit
import SnapKit

// Data Mock
struct dataDetailRecognition {
    var detail : [detailRecognition]
    var recognition : [medalRecognition]
    
    struct detailRecognition {
        var title : String
        var detalle : String
    }
    
    struct medalRecognition {
        var icon : String
        var title : String
    }
}

var listRecognition : [dataDetailRecognition.detailRecognition] = [
    dataDetailRecognition.detailRecognition(title: "Gestión", detalle: "202224"),
    dataDetailRecognition.detailRecognition(title: "Incidente", detalle: "202224202224"),
    dataDetailRecognition.detailRecognition(title: "Estado", detalle: "Disponible"),
    dataDetailRecognition.detailRecognition(title: "Fecha de creacion", detalle: "13/05/2023"),
    dataDetailRecognition.detailRecognition(title: "Líder", detalle: "Daniel Gustavo de la Paz"),
    dataDetailRecognition.detailRecognition(title: "Motivo", detalle: "Excelente desempeño en el mes")
]

var itemMedalRecognitions : [dataDetailRecognition.medalRecognition] = [
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Entrega"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Integridad"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Amor a la patria"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Desenpeño"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Entrega"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Integridad"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Amor a la patria"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Desenpeño"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Entrega"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Integridad"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Amor a la patria"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Desenpeño"),
    dataDetailRecognition.medalRecognition(icon: "graduationcap", title: "Desenpeño")
]

var dataDetailRecognitions : dataDetailRecognition = dataDetailRecognition(
    detail: listRecognition,
    recognition: itemMedalRecognitions)


extension DetailRecognitionsViewController {
    
    // CustomView para detalles de reconocimiento
    class CustomViewCell: UIView {
        
        var titleLbl: UILabel = {
            let lbl = UILabel()
            lbl.textAlignment = .left
            lbl.numberOfLines = 1
            lbl.font = UIFont.boldSystemFont(ofSize: 16)
            return lbl
        }()
        
        var descriptionLbl: UILabel = {
            var lbl = UILabel()
            lbl.textAlignment = .left
            lbl.numberOfLines = 1
            lbl.font = UIFont.systemFont(ofSize: 13)
            return lbl
        }()
        
        init() {
            super.init(frame: .zero)
            commonSetup()
        }
        
        func setupUI(title: String, description: String) {
            self.titleLbl.text = title
            self.descriptionLbl.text = description
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init?(coder :) has not been implemented")
        }
        
        private func commonSetup() {
            
            addSubview(titleLbl)
            addSubview(descriptionLbl)
            
            titleLbl.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(16)
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
            }
            
            descriptionLbl.snp.makeConstraints { make in
                make.top.equalTo(titleLbl.snp.bottom).offset(4)
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.bottom.equalToSuperview().offset(-16)
            }
        }
    }
    
    
    // Celda para medallas
    class DetailCollectionViewCell: UICollectionViewCell {
        
        private let contenIconView : UIView = {
            let view = UIView()
            view.backgroundColor = .systemYellow
            view.clipsToBounds = true
            view.layer.cornerRadius = 20
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        private let iconImageView: UIImageView = {
            let img = UIImageView()
            img.tintColor = .white
            img.contentMode = .scaleAspectFill
            return img
        }()
        
        private let descriptionLbl: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.textColor = .blue
            label.numberOfLines = 2
            label.textAlignment = .center
            return label
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupCell()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupCell()
        }
        
        
        private func setupCell() {
            backgroundColor = .black
            
            [contenIconView, descriptionLbl].forEach{ addSubview($0) }
            contenIconView.addSubview(iconImageView)
            
            contenIconView.snp.makeConstraints { make in
                make.width.height.equalTo(55)
                make.top.equalToSuperview().offset(5)
                make.centerX.equalToSuperview()
            }
            
            iconImageView.snp.makeConstraints { make in
                make.height.width.equalTo(40)
                make.center.equalToSuperview()
            }
            
            descriptionLbl.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(5)
                make.trailing.equalToSuperview().offset(-5)
                make.top.equalTo(contenIconView.snp.bottom).offset(3)
            }
        }
        
        func configureCell(icon: String, title: String) {
            let icon = UIImage(systemName: icon)?.withRenderingMode(.alwaysTemplate)
            icon?.withTintColor(.blue)
            iconImageView.image = icon
            descriptionLbl.text = title
        }
    }
    
}


