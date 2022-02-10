//
//  ViewController.swift
//  ViewLifecycle
//
//  Created by Саидов Тимур on 07.02.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var customView: CustomView = {
        let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var transitionButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemYellow
        button.setTitle("Перейти на другой экран", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNaigationBar()
        self.setupView()
    }
    
    private func setupNaigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Заголовок"
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.customView)
        self.view.addSubview(self.transitionButton)
        
        self.activateConstraints()
    }
    
    private func activateConstraints() {
        self.customView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.customView.bottomAnchor.constraint(equalTo: self.transitionButton.topAnchor, constant: -16).isActive = true
        
        self.transitionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.transitionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.transitionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.transitionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapTransitionButton() {
        let secondVC = SecondViewController()
        secondVC.closure = {
            // do smth.
        }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
