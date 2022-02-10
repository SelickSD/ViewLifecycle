//
//  MyView.swift
//  ViewLifecycle
//
//  Created by Саидов Тимур on 10.02.2022.
//

import UIKit

class MyView: UIView {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

    private func setupView() {
        let view = self.loadViewFromXib()
        self.addSubview(view)
        
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.first as? UIView else { return UIView() }
        
        return view
    }

}
