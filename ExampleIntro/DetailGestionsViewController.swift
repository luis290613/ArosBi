//
//  DetailGestionsViewController.swift
//  ExampleIntro
//
//  Created by Diego on 11/12/23.
//

import UIKit
import SnapKit

class DetailGestionsViewController: UIViewController {

    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
    let gestionView : CellView = {
        let view = CellView()
        view.setupUI(title: "Gestión", description: "20220001")
        return view
    }()
    
    let numberCorrelativeView : CellView = {
        let view = CellView()
        view.setupUI(title: "No. Correlativo", description: "507")
        return view
    }()
    
    let dateGestionView : CellView = {
        let view = CellView()
        view.setupUI(title: "Fecha de gestión", description: "13/15/2023")
        return view
    }()
    
    let dateExchangeView : CellView = {
        let view = CellView()
        view.setupUI(title: "Fecha de canje", description: "13/02/2023")
        return view
    }()
    
    
    let stateExchangeView : CellView = {
        let view = CellView()
        view.setupUI(title: "Estado", description: "Tramitada")
        return view
    }()
    let articleExchangeView : CellView = {
        let view = CellView()
        view.setupUI(title: "artículo", description: "Certificado de San Martín")
        return view
    }()
    let amountExchangeView : CellView = {
        let view = CellView()
        view.setupUI(title: "Cantidad", description: "1")
        return view
    }()
    let exchangeMethodView : CellView = {
        let view = CellView()
        view.setupUI(title: "Método de canje", description: "Entrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficinaEntrega en oficina")
        return view
    }()
    let observationExchangeView : CellView = {
        let view = CellView()
        view.setupUI(title: "Observaciones", description: "Historial de observaciones", activeIcon: true)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(topView)
        
        
        
        scrollView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }
        
        [topView, gestionView, numberCorrelativeView, dateGestionView, dateExchangeView, stateExchangeView, articleExchangeView, amountExchangeView, exchangeMethodView, observationExchangeView].forEach {
            containerView.addSubview($0)
        }
        
        topView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalTo(containerView.snp.top)
            make.horizontalEdges.equalToSuperview()
        }
        
        gestionView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.leading.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        
        numberCorrelativeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.trailing.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        
        dateGestionView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.leading.equalToSuperview()
            make.top.equalTo(gestionView.snp.bottom)
        }
        
        dateExchangeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.trailing.equalToSuperview()
            make.top.equalTo(numberCorrelativeView.snp.bottom)
        }
        
        stateExchangeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(dateGestionView.snp.bottom)
        }
        
        articleExchangeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(stateExchangeView.snp.bottom)
        }
        
        amountExchangeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(articleExchangeView.snp.bottom)
        }
        
        exchangeMethodView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(amountExchangeView.snp.bottom)
        }
        
        observationExchangeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(exchangeMethodView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    

}


extension DetailGestionsViewController {
    class CellView : UIView {
        
        private var titleLbl: UILabel = {
            let lbl = UILabel()
            lbl.font = UIFont.boldSystemFont(ofSize: 14)
            return lbl
        }()
        
        private var descriptionLbl: UILabel = {
            let lbl = UILabel()
            lbl.font = UIFont.systemFont(ofSize: 13)
            lbl.numberOfLines = 0
            return lbl
        }()
        
        private var iconImg: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(systemName: "plus")
            return img
        }()
        
        private var linearView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray.withAlphaComponent(0.3)
            return view
        }()
        
        
        init() {
            super.init(frame: .zero)
            commonSetup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        
        func setupUI(title: String, description: String, activeIcon: Bool = false) {
            self.titleLbl.text = title
            self.descriptionLbl.text = description
            self.iconImg.isHidden = !activeIcon
        }
        
        
        private func commonSetup() {
            addSubview(titleLbl)
            addSubview(descriptionLbl)
            addSubview(linearView)
            addSubview(iconImg)
            
            titleLbl.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview().inset(16)
                make.top.equalToSuperview().inset(16)
            }
            
            iconImg.snp.makeConstraints { make in
                make.height.width.equalTo(20)
                make.trailing.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
            }
            
            descriptionLbl.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(16)
                make.trailing.equalTo(iconImg.snp.leading).offset(5)
                make.top.equalTo(titleLbl.snp.bottom).offset(4)
            }
            
            linearView.snp.makeConstraints { make in
                make.height.equalTo(1)
                make.top.equalTo(descriptionLbl.snp.bottom).offset(16)
                make.bottom.equalToSuperview()
                make.horizontalEdges.equalToSuperview()
            }
        }
    }
    
}


