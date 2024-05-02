//
//  DetailRecognitionsViewController.swift
//  ExampleIntro
//
//  Created by Diego on 21/11/23.
//

import UIKit
import SnapKit

class DetailRecognitionsViewController: UIViewController {
    
    let data : dataDetailRecognition = dataDetailRecognitions
    var widthItemCollection : CGFloat = 0
    var heightItemCollection : CGFloat = 0
    
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
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.spacing = 0
        stack.axis = .vertical
        return stack
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    func setupUI() {
        view.backgroundColor = .white
        title = "Detalle"
        widthItemCollection = (view.bounds.width - 30) / 4
        heightItemCollection = widthItemCollection + 20

        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(topView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }

        topView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }

        setupStack()
        setupMedailsCollection()
    }

    private func setupStack() {
        containerView.addSubview(stackView)

        for item in data.detail {
            let customView = CustomViewCell()
            customView.setupUI(title: item.title, description: item.detalle)
            stackView.addArrangedSubview(customView)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
        }
        
    }
    
    private func setupMedailsCollection() {
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        containerView.addSubview(collectionView)
        
        print("Diego...... widthItemCollection: \(widthItemCollection)")
        print("Diego...... heightItemCollection: \(heightItemCollection)")
        
        let numberRow = (Double(data.recognition.count) / Double(4)).rounded(.up)
        print("Diego...... numberRow: \(numberRow)")
        
        let heightCollection = numberRow * heightItemCollection
        print("Diego...... heightFinal: \(heightCollection)")
        
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(heightCollection)
        }
        
    }
}

// MARK: Configuration CollectionView
extension DetailRecognitionsViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.recognition.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        let item = data.recognition[indexPath.row]
        cell.configureCell(icon: item.icon, title: item.title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthItemCollection, height: widthItemCollection + 20)
    }

}
