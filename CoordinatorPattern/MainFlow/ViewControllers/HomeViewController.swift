//
//  HomeViewController.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    let stackView = UIStackView()
    let mainLabel = UILabel()
    let secondVCButton = UIButton()
    let thirdVCButton = UIButton()
    let firstSubFlowLabel = UILabel()
    
    weak var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupStackView()
        setupMainLabelView()
        setupSecondVCButton()
        setupThirdVCButton()
        setupFirstSubFLowLabel()
    }
    
    private func setupSelfView() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(mainLabel)
        self.stackView.addArrangedSubview(secondVCButton)
        self.stackView.addArrangedSubview(thirdVCButton)
        self.view.addSubview(firstSubFlowLabel)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupMainLabelView() {
        mainLabel.text = "Home View Controller"
        mainLabel.font = UIFont(name: "Times", size: 30)
        mainLabel.textAlignment = .center
    }
    
    private func setupSecondVCButton() {
        secondVCButton.setTitle("Second View Controller", for: .normal)
        secondVCButton.backgroundColor = .blue
        secondVCButton.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
    }
    
    private func setupThirdVCButton() {
        thirdVCButton.setTitle("Third View Controller", for: .normal)
        thirdVCButton.backgroundColor = .blue
        thirdVCButton.addTarget(self, action: #selector(goToThirdVC), for: .touchUpInside)
    }
    
    private func setupFirstSubFLowLabel() {
        firstSubFlowLabel.text = "First Sub Flow"
        firstSubFlowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstSubFlowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstSubFlowLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToFirstSubFlow))
        firstSubFlowLabel.addGestureRecognizer(tapGesture)
        firstSubFlowLabel.isUserInteractionEnabled = true

    }
    
    @objc private func goToSecondVC() {
        guard let mainCoordinator = self.coordinator as? MainFlowCoordinator else {return}
        mainCoordinator.goToSecondVC()
    }
    
    @objc private func goToThirdVC() {
        guard let mainCoordinator = self.coordinator as? MainFlowCoordinator else {return}
        mainCoordinator.goToThirdVC()
    }
    
    @objc private func goToFirstSubFlow() {
        guard let mainCoordinator = self.coordinator as? MainFlowCoordinator else {return}
        mainCoordinator.goToSubFlowCoordinator()
    }
}

