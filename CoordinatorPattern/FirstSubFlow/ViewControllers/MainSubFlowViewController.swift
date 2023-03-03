//
//  MainSubFlowViewController.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

class MainSubFlowViewController: UIViewController {
    let stackView = UIStackView()
    let mainLabel = UILabel()
    let dismissSubFlow = UILabel()
    
    weak var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupStackView()
        setupMainLabelView()
        setupDismissSubFlow()
    }
    
    private func setupSelfView() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(mainLabel)
        self.view.addSubview(dismissSubFlow)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupStackView() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupMainLabelView() {
        mainLabel.text = "Main Sub Flow View Controller"
        mainLabel.font = UIFont(name: "Times", size: 30)
        mainLabel.textAlignment = .center
    }
    
    private func setupDismissSubFlow() {
        dismissSubFlow.text = "Dismiss Sub Flow"
        dismissSubFlow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissSubFlow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissSubFlow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissFirstSubFlow))
        dismissSubFlow.addGestureRecognizer(tapGesture)
        dismissSubFlow.isUserInteractionEnabled = true
    }
    
    @objc private func dismissFirstSubFlow() {
        guard let firstSubFlowCoordinator = self.coordinator as? FirstSubFlowCoordinator else {return}
        firstSubFlowCoordinator.finish()
    }
}
