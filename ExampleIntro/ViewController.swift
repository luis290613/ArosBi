//
//  ViewController.swift
//  ExampleIntro
//
//  Created by Diego on 10/11/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Crear dos vistas
        let view1 = UIView()
        view1.backgroundColor = UIColor.red

//        let view2 = UIView()
//        view2.backgroundColor = UIColor.blue

        // Crear un stack view
        let stackView = UIStackView(arrangedSubviews: [view1])

//        stackView.addSubview(view1)

        // Configurar el stack view
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8  // Espacio entre las vistas

        // Agregar el stack view a la vista principal
        view.addSubview(stackView)

        // Configurar restricciones
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view1.translatesAutoresizingMaskIntoConstraints = false
//        view2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            view1.heightAnchor.constraint(equalToConstant: 50),
//            view2.heightAnchor.constraint(equalToConstant: 200),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

//class ViewController: UIViewController {
//
//    let itemsPickerView : [String] = ["Programada", "Tramitada", "Finalizada", "Cancelada"]
//    
//    let topView : UIView = {
//        let view = UIView()
//        view.backgroundColor = .gray
//        return view
//    }()
//    
//    
//    let titleDateLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Fechas"
//        return lbl
//    }()
//    
//    let dateStartTxt : IconRightTextField = {
//        let txt = IconRightTextField()
//        txt.setCustomIcon(UIImage(systemName: "magnifyingglass"))
//        txt.placeholder = "Del"
//        return txt
//    }()
//
//    let dateEndTxt : IconRightTextField = {
//        let txt = IconRightTextField()
//        txt.setCustomIcon(UIImage(systemName: "magnifyingglass"))
//        txt.placeholder = "Al"
//        return txt
//    }()
//    
//    
//    let titleStateLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Estado"
//        return lbl
//    }()
//    
//    let stateTxt : IconRightTextField = {
//        let txt = IconRightTextField()
//        txt.setCustomIcon(UIImage(systemName: "magnifyingglass"))
//        txt.placeholder = "Estado"
//        return txt
//    }()
//    
//    
//    let titleNumberGestionLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.text = "No. de gestión"
//        return lbl
//    }()
//    
//    let numberGestionTxt : IconRightTextField = {
//        let txt = IconRightTextField()
//        txt.setCustomIcon()
//        txt.placeholder = "Ingresa un número de gestión"
//        return txt
//    }()
//    
//    
//    private let datePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .date
//        picker.preferredDatePickerStyle = .wheels
//        return picker
//    }()
//    
//    let statePickerView: UIPickerView = {
//        let pickerView = UIPickerView()
//        return pickerView
//    }()
//    
//    
//    // life cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    func setupUI() {
//        view.backgroundColor = .white
//        
//        view.addSubview(topView)
//        topView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.height.equalTo(20)
//            make.horizontalEdges.equalToSuperview()
//        }
//        
//        [titleDateLbl, dateStartTxt, dateEndTxt, titleStateLbl, stateTxt, titleNumberGestionLbl, numberGestionTxt].forEach {
//            view.addSubview($0)
//        }
//        
//        titleDateLbl.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(18)
//            make.top.equalTo(topView.snp.bottom).offset(24)
//        }
//        
//        dateStartTxt.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.44)
//            make.height.equalTo(42.7)
//            make.leading.equalToSuperview().inset(18)
//            make.top.equalTo(titleDateLbl.snp.bottom).offset(16)
//        }
//        
//        dateEndTxt.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.44)
//            make.height.equalTo(42.7)
//            make.trailing.equalToSuperview().inset(18)
//            make.top.equalTo(titleDateLbl.snp.bottom).offset(16)
//        }
//        
//        titleStateLbl.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(18)
//            make.top.equalTo(dateStartTxt.snp.bottom).offset(40)
//        }
//        
//        stateTxt.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(18)
//            make.top.equalTo(titleStateLbl.snp.bottom).offset(16)
//            make.height.equalTo(42.7)
//        }
//        
//        titleNumberGestionLbl.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(18)
//            make.top.equalTo(stateTxt.snp.bottom).offset(40)
//        }
//        
//        numberGestionTxt.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(18)
//            make.top.equalTo(titleNumberGestionLbl.snp.bottom).offset(16)
//            make.height.equalTo(42.7)
//        }
//        
//        setupTextFilter(textField: dateStartTxt)
//        setupTextFilter(textField: dateEndTxt)
//        setupStatePickerView()
//    }
//    
//    
//    private func setupTextFilter(textField: IconRightTextField) {
//        
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
//        
//        textField.delegate = self
//        textField.inputView = datePicker
//        textField.inputAccessoryView = doneButtonPickerView()
//    }
//    
//    private func setupStatePickerView() {
//        stateTxt.inputView = statePickerView
//        stateTxt.inputAccessoryView = doneButtonPickerView()
//        
//        stateTxt.delegate = self
//        statePickerView.delegate = self
//        statePickerView.dataSource = self
//    }
//    
//    private func doneButtonPickerView() -> UIToolbar {
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
//        let toolbar = UIToolbar()
//        toolbar.setItems([doneButton], animated: false)
//        toolbar.sizeToFit()
//        return toolbar
//    }
//    
//    
//    @objc private func doneButtonTapped() {
//        view.endEditing(true)
//    }
//    
//    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
//        if dateStartTxt.isFirstResponder {
//            dateStartTxt.text = sender.date.getString()
//        } else if dateEndTxt.isFirstResponder {
//            dateEndTxt.text = sender.date.getString()
//        }
//    }
//    
//}
//
//
//extension ViewController : UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if let text = textField.text, let date = text.toDate() {
//            datePicker.setDate(date, animated: true)
//        } else {
//            print("else")
//        }
//    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return false
//    }
//}
//
//
//extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    
//    // Número de componentes en el picker
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    // Número de filas en el picker
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        // Retorna el número de elementos en tu conjunto de datos
//        return itemsPickerView.count
//    }
//    
//    // Título de la fila seleccionada
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return itemsPickerView[row]
//    }
//    
//    // Acción al seleccionar una fila
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        stateTxt.text = itemsPickerView[row]
//    }
//}
