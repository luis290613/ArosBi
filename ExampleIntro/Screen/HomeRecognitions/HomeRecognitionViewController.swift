//
//  HomeRecognitionViewController.swift
//  ExampleIntro
//
//  Created by Diego on 16/11/23.
//

import UIKit
import SnapKit

enum itemHeader {
    case myRecognitions
    case recognize
}

class HomeRecognitionViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var myRecognitionsView = titleRecognitionView()
    var recognizeView = titleRecognitionView()
    var dataSections : [SectionItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white
        title = "Reconocimiento Bi - RRHH"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        tableView.register(CustomTableViewCellTwo.self, forCellReuseIdentifier: "cell")

        
        myRecognitionsView.setupUI(title: "Mis Reconocimientos")
        recognizeView.setupUI(title: "Reconocer")
        selectHeader(item: .myRecognitions)
        
        myRecognitionsView.actionHandler = { [weak self] in
            self?.selectHeader(item: .myRecognitions)
        }
        
        recognizeView.actionHandler = { [weak self] in
            self?.selectHeader(item: .recognize)
        }
        
        
        [tableView, myRecognitionsView, recognizeView].forEach{ view.addSubview($0)}
        
        myRecognitionsView.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(view.snp.width).multipliedBy(0.47)
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        recognizeView.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(view.snp.width).multipliedBy(0.47)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(recognizeView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func selectHeader(item: itemHeader) {
        switch item {
        case .myRecognitions:
            myRecognitionsView.selected(true)
            recognizeView.selected(false)
            
            // llenar y recargar tabla
            dataSections = dataSectionsMyRecognitionMock
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        case .recognize:
            myRecognitionsView.selected(false)
            recognizeView.selected(true)
            
            // llenar y recargar tabla
            
            dataSections = dataSectionsRecognizeMock
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension HomeRecognitionViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSections[section].data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configutationTableViewCell(indexPath)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       headerTable(title: dataSections[section].title)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(FilterDateViewController(), animated: true)
    }
    
    private func configutationTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCellTwo else {
            return UITableViewCell()
        }
        let data = dataSections[indexPath.section].data[indexPath.row]
        cell.configureCell(icon: data.image, text: data.description)
        return cell
    }
    
    
    private func headerTable(title: String) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .white
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.numberOfLines = 1
            label.text = title
            return label
        }()
        
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 16, bottom: 16, right: 16))
            make.height.equalTo(20)
        }
        
        return containerView
    }

}




class titleRecognitionView: UIView {
    
    var actionHandler: (() -> Void)?
    
    private var footerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    
    
    init() {
        super.init(frame: .zero)
        commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder :) has not been implemented")
    }
    
    
    func setupUI(title: String) {
        self.titleLbl.text = title
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGesture)
        
        
    }
    
    func selected(_ selected: Bool) {
        if selected {
            footerView.backgroundColor = .blue
            titleLbl.font = UIFont.boldSystemFont(ofSize: 14)
        } else {
            footerView.backgroundColor = .clear
            titleLbl.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    private func commonSetup() {
        addSubview(titleLbl)
        addSubview(footerView)
        
        titleLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        footerView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func handleTapGesture() {
        actionHandler?()
    }
    
}
