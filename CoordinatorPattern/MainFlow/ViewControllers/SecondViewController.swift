//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

class SecondViewController: UIViewController {
    let stackView = UIStackView()
    let mainLabel = UILabel()
    let thirdVCButton = UIButton()
    
    weak var coordinator: MainFlowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupStackView()
        setupMainLabelView()
        setupThirdVCButton()
    }
    
    private func setupSelfView() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(mainLabel)
        self.stackView.addArrangedSubview(thirdVCButton)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupMainLabelView() {
        mainLabel.text = "Second View Controller"
        mainLabel.font = UIFont(name: "Times", size: 30)
        mainLabel.textAlignment = .center
    }
    
    private func setupThirdVCButton() {
        thirdVCButton.setTitle("Third View Controller", for: .normal)
        thirdVCButton.backgroundColor = .blue
        thirdVCButton.addTarget(self, action: #selector(goToThirdVC), for: .touchUpInside)
    }
    
    @objc private func goToThirdVC() {
        self.coordinator?.goToThirdVC()
    }
}
