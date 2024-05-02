//
//  ViewControllerV3.swift
//  ExampleIntro
//
//  Created by Diego on 18/12/23.
//
import UIKit

class ViewControllerV3: UIViewController {

    var checkBoxButton: UIButton!
    var isChecked: Bool = false {
        didSet {
            checkBoxButton.isSelected = isChecked
            handleButtonAction()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        checkBoxButton = UIButton(type: .custom)
        checkBoxButton.frame = CGRect(x: 50, y: 50, width: 30, height: 30)
        
        // Establecer imágenes para los estados seleccionado y deseleccionado
        checkBoxButton.setImage(UIImage(systemName: "staroflife.circle"), for: .normal)
        checkBoxButton.setImage(UIImage(systemName: "staroflife.circle.fill"), for: .selected)
        
        checkBoxButton.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        
        view.addSubview(checkBoxButton)
    }

    @objc func checkBoxTapped() {
        isChecked = !isChecked
    }
    
    func handleButtonAction() {
        if checkBoxButton.isSelected {
            print("Botón seleccionado")
        } else {
            print("Botón no seleccionado")
        }
    }
}

