//
//  ListGestionsViewController.swift
//  ExampleIntro
//
//  Created by Diego on 10/12/23.
//

import UIKit

enum StateGestion: String {
    case programada = "Programada"
    case tramitada = "Tramitada"
    case finalizada = "Finalziada"
    case cancelada = "Cancelada"
}


struct ModelGestion {
    var state : StateGestion
    var title: String
    var description : String
}


let modelMock : [ModelGestion] = [
    ModelGestion(state: .programada, title: "Certificado San Martin x1", description: "202200001 | 13/05/2023"),
    ModelGestion(state: .tramitada, title: "Certificado San Martin x2", description: "202200001 | 13/05/2023"),
    ModelGestion(state: .finalizada, title: "Mochila x1", description: "202200001 | 13/05/2023"),
    ModelGestion(state: .cancelada, title: "Mochila x2", description: "202200001 | 13/05/2023"),
]
class ListGestionsViewController: UIViewController {

    private let filterBtn: SecondaryButtonIcon = {
        let btn = SecondaryButtonIcon()
        let image = UIImage(named: "iconCanje")
        btn.configure(title: "Mis gestiones", image: image, backColor: .red)
        return btn
    }()
    
    var recognitionTbl : UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .white
        return tbl
    }()
    
    let emptyView: UIView = {
        let emptyView = UIView()
        
        let img = UIImageView()
        img.image = UIImage(systemName: "square.and.arrow.up") //BIImage.recognitionsTabar
        img.contentMode = .scaleAspectFit
        img.tintColor = .blue//BIColors.blueExpert
        
        let lbl = UILabel()
        lbl.text = "MainRecognitionCommonStrings.ScreenListRecognitions.emptyView"
//        lbl.font = BiBFont.AndesNeue.book14
        lbl.textColor = .blue//BIColors.blueExpert
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        
        emptyView.addSubview(img)
        emptyView.addSubview(lbl)
        
        img.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(emptyView.snp.centerY).offset(-70)
        }
        
        lbl.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        emptyView.isHidden = true
        
        return emptyView
    }()
    
    var data: [ModelGestion] = modelMock
    
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        recognitionTbl.delegate = self
        recognitionTbl.dataSource = self
        recognitionTbl.backgroundView = emptyView
        recognitionTbl.register(ListRecognitionsTableViewCell.self, forCellReuseIdentifier: "ListRecognitionsTableViewCell")
        
        view.addSubview(filterBtn)
        
        filterBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.height.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.addSubview(recognitionTbl)
        
        recognitionTbl.snp.makeConstraints { make in
            make.top.equalTo(filterBtn.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension ListGestionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListRecognitionsTableViewCell", for: indexPath) as? ListRecognitionsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(item: data[indexPath.row])
        return cell
    }
    
}

// MARK: - Cell...

class ListRecognitionsTableViewCell: UITableViewCell {

    let dateCreationStateLbl : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
//        lbl.textColor = BIColors.blueExpert
//        lbl.font = BiBFont.AndesNeue.book13
        return lbl
    }()
    
    let titleLbl : UILabel = {
        let lbl = UILabel()
//        lbl.font = BiBFont.BiNeoIndustrial.bold14
//        lbl.textColor = BIColors.blueExpert
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let descriptionLbl : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
//        lbl.textColor = BIColors.blueExpert
//        lbl.font = BiBFont.AndesNeue.book13
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func setupUI() {
        selectionStyle = .none
        
        [dateCreationStateLbl, titleLbl, descriptionLbl].forEach { addSubview($0) }
        
        dateCreationStateLbl.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(dateCreationStateLbl.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(4)
            make.horizontalEdges.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configure(item : ModelGestion) {
        configureStatus(state: item.state)
        //dateCreationStateLbl.text = ["programada", "tramitada", "finalizada", "cancelada"].randomElement()
        titleLbl.text = item.title
        descriptionLbl.text = item.description
    }
    
    private func configureStatus(state : StateGestion) {
        dateCreationStateLbl.text = "\(state.rawValue) *"
        switch state {
        case .cancelada:
            dateCreationStateLbl.textColor = .red
        default:
            dateCreationStateLbl.textColor = .black
        }
        
    }
}



public class SecondaryButtonIcon: UIButton {
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Public Methods
    
    public func configure(title: String, titleColor: UIColor = .blue, image: UIImage?, backColor : UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image,for: .normal)
        tintColor = titleColor
        
        setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
        
        backgroundColor = backColor
        
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        semanticContentAttribute = .forceRightToLeft
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        
//        setTitleColor(.gray, for: .disabled)
//        if #available(iOS 15.0, *) {
//            configurationUpdateHandler = { button in
//                switch button.state {
//                case .disabled:
//                    self.alpha = 0.5
//                default:
//                    break
//                }
//            }
//        } else {
//
//        }
        
    }
}


/*//
 //  ViewController.swift
 //  ExampleIntro
 //
 //  Created by Diego on 10/11/23.
 //

 import UIKit
 import SnapKit

 class ViewController: UIViewController {

     let searchTXT : InsetTextField = {
         let txt = InsetTextField()
         txt.layer.cornerRadius = 5
         txt.layer.borderWidth = 1
         txt.layer.borderColor = UIColor.black.cgColor
         txt.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)

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
             make.width.equalTo(200)
             make.height.equalTo(50)
             make.center.equalToSuperview()
         }
         
         let iconImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
         iconImageView.contentMode = .center
         
         iconImageView.snp.makeConstraints { make in
             make.height.width.equalTo(40)
         }
         
         searchTXT.rightView = iconImageView
         searchTXT.rightViewMode = .always
         
     }
     
 }

 class InsetTextField: UITextField {
     
     // Establece el UIEdgeInsets que desees
     var textInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     
     override func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: textInsets)
     }
     
     override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: textInsets)
     }
 }


 import UIKit

 class CustomTextField: UITextField {
     
     // Establece el UIEdgeInsets que desees
     var textInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

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
         // Configuración común del textfield
         // Puedes personalizar aquí según tus necesidades
         borderStyle = .roundedRect
         layer.cornerRadius = 8
         layer.borderWidth = 1
         layer.borderColor = UIColor.lightGray.cgColor
         textColor = UIColor.darkText
         backgroundColor = UIColor.white
         font = UIFont.systemFont(ofSize: 16)
         autocorrectionType = .no
         keyboardType = .default
         returnKeyType = .done
         placeholder = "Placeholder"
         clearButtonMode = .whileEditing
     }
 }
*/
