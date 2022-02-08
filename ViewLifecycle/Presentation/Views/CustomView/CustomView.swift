//
//  CustomView.swift
//  ViewLifecycle
//
//  Created by Саидов Тимур on 07.02.2022.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var asyncButton: UIButton!
    @IBOutlet weak var syncButton: UIButton!
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var topViewConstraint: NSLayoutConstraint!
    
    private var isExpanded = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        let view = self.loadViewFromXib()
        self.addSubview(view)
        view.frame = self.bounds
        
        self.asyncButton.setTitle("Асинхронное действие", for: .normal)
        self.syncButton.setTitle("Синхронное действие", for: .normal)
        let buttons = [self.asyncButton, self.syncButton].compactMap({ $0 })
        buttons.forEach { button in
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
        }
    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? UIView else { return UIView() }
        
        return view
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender.tag == 1 {
            self.topViewConstraint.constant = self.isExpanded ? 300 : 16

            UIView.animate(withDuration: 2.0) {
                self.setNeedsLayout()
            } completion: { _ in
                self.isExpanded.toggle()
            }

        } else if sender.tag == 2 {
            self.topViewConstraint.constant = self.isExpanded ? 300 : 16

            UIView.animate(withDuration: 2.0) {
                self.layoutIfNeeded()
            } completion: { _ in
                self.isExpanded.toggle()
            }
        }
    }
}
