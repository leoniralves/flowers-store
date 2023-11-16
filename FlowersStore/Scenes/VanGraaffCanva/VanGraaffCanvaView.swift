//
//  VanGraaffCanvaView.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 15/11/23.
//

import UIKit

struct VanGraaffCanvaViewConfig {
    var superiorLimit: Double
    var inferiorLimit: Double
    var internalLimit: Double
    var ExternalLimit: Double

    var referencePoint: Double
}

protocol VanGraaffCanvaViewDelegate: AnyObject {
    func calculate(height: String, width: String)
}

final class VanGraaffCanvaView: UIView {
    private(set) lazy var mainStackView: UIStackView = buildStackView()
    
    private(set) lazy var superiorLimitLabel: UILabel = buildLabel()
    private(set) lazy var inferiorLimitLabel: UILabel = buildLabel()
    private(set) lazy var internalLimitLabel: UILabel = buildLabel()
    private(set) lazy var ExternalLimitLabel: UILabel = buildLabel()
    private(set) lazy var referencePointLabel: UILabel = buildLabel()

    private(set) lazy var heightTextField: UITextField = buildTextField(placeholder: "Altura")
    private(set) lazy var widthTextField: UITextField = buildTextField(placeholder: "Largura")

    private weak var delegate: VanGraaffCanvaViewDelegate?

    func fill(delegate: VanGraaffCanvaViewDelegate) {
        setupView()
        self.delegate = delegate
    }

    func update(config: VanGraaffCanvaViewConfig) {
        superiorLimitLabel.text = "Limite superior " + config.superiorLimit.description
        inferiorLimitLabel.text = "Limite inferior " + config.inferiorLimit.description
        internalLimitLabel.text = "Margem interna " + config.internalLimit.description
        ExternalLimitLabel.text = "Margem externa " + config.ExternalLimit.description
        referencePointLabel.text = "Ponto de referencia " + config.referencePoint.description
    }
}

extension VanGraaffCanvaView: ViewCode {
    func setupHierarchy() {
        addSubviews(mainStackView, heightTextField, widthTextField)

        mainStackView.addArrangedSubviews(superiorLimitLabel, inferiorLimitLabel, internalLimitLabel, ExternalLimitLabel, referencePointLabel)
    }
    
    func setupConstraints() {
        mainStackView
            .topAnchor(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
            .leadingAnchorToSuperview(constant: 16)
            .trailingAnchorToSuperview(constant: -16)

        heightTextField
            .topAnchor(equalTo: mainStackView.bottomAnchor, constant: 24)
            .leadingAnchorToSuperview(constant: 16)
            .trailingAnchorToSuperview(constant: -16)

        widthTextField
            .topAnchor(equalTo: heightTextField.bottomAnchor, constant: 8)
            .leadingAnchorToSuperview(constant: 16)
            .trailingAnchorToSuperview(constant: -16)
    }
}

extension VanGraaffCanvaView: UITextFieldDelegate {
    
}

private extension VanGraaffCanvaView {
    func buildLabel() -> UILabel {
        let label: UILabel = .init()

        label.textColor = .black

        return label
    }

    func buildStackView() -> UIStackView {
        let view: UIStackView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 16

        return view
    }

    func buildTextField(placeholder: String) -> UITextField {
        let textfield: UITextField = .init()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.placeholder = placeholder
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .white
        textfield.returnKeyType = .next
        textfield.textColor = .black
        textfield.attributedPlaceholder = .init(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textfield.delegate = self

        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = .init(genericCMYKCyan: 150, magenta: 100, yellow: 20, black: 40, alpha: 1)

        addDoneButtonOnKeyboard(textfield: textfield)

        return textfield
    }

    func addDoneButtonOnKeyboard(textfield: UITextField){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textfield.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(_ button: UIBarButtonItem){
        endEditing(true)

        if let height = heightTextField.text, let width = widthTextField.text, !height.isEmpty && !width.isEmpty {
            delegate?.calculate(height: height, width: width)
        }
    }
}
