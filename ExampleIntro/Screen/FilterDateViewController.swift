//
//  FilterDateViewController.swift
//  ExampleIntro
//
//  Created by Diego on 10/11/23.
//

import UIKit
import SnapKit

class FilterDateViewController: UIViewController {
    
    let descriptionFilterLbl: UILabel = {
        var lbl = UILabel()
        lbl.text = "Selecciona el período a visualizar"
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let filterStartTxt: UITextField = {
        var txt = UITextField()
        txt.placeholder = "Del"
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 1.0
        txt.layer.cornerRadius = 5
        return txt
    }()
    
    let filterEndtTxt: UITextField = {
        var txt = UITextField()
        txt.placeholder = "Al"
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 1.0
        txt.layer.cornerRadius = 5
        return txt
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    private let filterBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitle("VISUALIZAR", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.layer.cornerRadius = 20
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPicker()
    }
    
    func setupView() {
        title = "Mis Reconocimientos Bi"
        
        filterStartTxt.rightView = getIcon()
        filterStartTxt.rightViewMode = .always
        
        filterEndtTxt.rightView = getIcon()
        filterEndtTxt.rightViewMode = .always
        
        [descriptionFilterLbl, filterStartTxt, filterEndtTxt, filterBtn].forEach { view.addSubview($0) }
        
        descriptionFilterLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        filterStartTxt.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.44)
            make.height.equalTo(45)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.top.equalTo(descriptionFilterLbl.snp.bottom).offset(24)
        }
        
        filterEndtTxt.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.44)
            make.height.equalTo(45)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            make.top.equalTo(descriptionFilterLbl.snp.bottom).offset(24)
        }
        
        filterBtn.snp.makeConstraints { make in
            make.height.equalTo(46)
            make.leading.equalTo(view.snp.leading).offset(40)
            make.trailing.equalTo(view.snp.trailing).offset(-40)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        filterStartTxt.setLeftPadding(10)
        filterEndtTxt.setLeftPadding(10)
    }
    
    func setupPicker() {
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        filterStartTxt.delegate = self
        filterEndtTxt.delegate = self
        
        filterStartTxt.inputView = datePicker
        filterEndtTxt.inputView = datePicker
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        let toolbar = UIToolbar()
        toolbar.setItems([doneButton], animated: false)
        toolbar.sizeToFit()
        
        filterStartTxt.inputAccessoryView = toolbar
        filterEndtTxt.inputAccessoryView = toolbar
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        if filterStartTxt.isFirstResponder {
            filterStartTxt.text = formatDate(sender.date)
        } else if filterEndtTxt.isFirstResponder {
            filterEndtTxt.text = formatDate(sender.date)
        }
    }
    
    private func formatDateFromString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    @objc private func doneButtonTapped() {
        view.endEditing(true)
    }
    
    func getIcon() -> UIView {
        let rightView = UIView()
        let imageView = UIImageView(image: UIImage(systemName: "arrow.up.left.and.arrow.down.right"))
        
        rightView.addSubview(imageView)
        
        rightView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.width.equalTo(18)
            make.centerX.equalTo(rightView.snp.centerX)
            make.centerY.equalTo(rightView.snp.centerY)
        }
        
        return rightView
    }
}

extension FilterDateViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let text = textField.text, let date = formatDateFromString(text) {
            datePicker.setDate(date, animated: true)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
