//
//  HomeRecognitionCell.swift
//  ExampleIntro
//
//  Created by Diego on 16/11/23.
//

import UIKit

// MARK: - MOCK...

struct SectionItem {
    let title: String
    let data: [ItemData]
    
    struct ItemData {
        let image: String
        let description: String
    }
}

let dataSectionsMyRecognitionMock: [SectionItem] = [
    SectionItem(
        title: "Desenpeño Extraordinario del Día a Día",
        data: [
            SectionItem.ItemData(image: "creditcard.viewfinder", description: "Mis reconocimientos Bi"),
            SectionItem.ItemData(image: "creditcard.viewfinder", description: "Canjear reconocimientos Bi"),
        ]
    ),
    SectionItem(
        title: "Desenpeño Extraordinario Semestral",
        data: [
            SectionItem.ItemData(image: "creditcard.viewfinder", description: "Mis reconocimientos Bi")
        ]
    )
]

let dataSectionsRecognizeMock: [SectionItem] = [
    SectionItem(
        title: "Desenpeño Extraordinario del Día a Día",
        data: [
            SectionItem.ItemData(image: "creditcard.viewfinder", description: "Reconocer a un colaborador que me reporta"),
            SectionItem.ItemData(image: "creditcard.viewfinder", description: "Reconocer a otro colaborador"),
        ]
    ),
    SectionItem(
        title: "Desenpeño Extraordinario Semestral",
        data: [
            SectionItem.ItemData(image: "creditcard.viewfinder", description: "Nominar")
        ]
    )
]


extension HomeRecognitionViewController {
    
    class CustomTableViewCellTwo: UITableViewCell {

        let contenIconView : UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            view.layer.cornerRadius = 14
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        let iconImageView: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(systemName: "creditcard")?.withRenderingMode(.alwaysTemplate)
            img.tintColor = .white
            img.contentMode = .scaleAspectFit
            return img
        }()

        let descriptionLbl: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .systemBlue
            label.numberOfLines = 2
            return label
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupCell()
        }

        private func setupCell() {
            backgroundColor = .white
            selectionStyle = .none
            
            [contenIconView, descriptionLbl].forEach{ addSubview($0) }
            contenIconView.addSubview(iconImageView)
            
            contenIconView.snp.makeConstraints { make in
                make.height.width.equalTo(45)
                make.leading.equalToSuperview().offset(18)
                make.top.equalToSuperview().offset(16)
                make.bottom.equalToSuperview().offset(-16)
            }
        
            iconImageView.snp.makeConstraints { make in
                make.height.width.equalTo(30)
                make.center.equalToSuperview()
            }

            descriptionLbl.snp.makeConstraints { make in
                make.leading.equalTo(contenIconView.snp.trailing).offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.centerY.equalTo(contenIconView.snp.centerY)
            }
        }

        func configureCell(icon: String, text: String) {
            iconImageView.image = UIImage(systemName: icon)
            descriptionLbl.text = text
        }
    }
    
}
