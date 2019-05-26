//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Andrey on 5/20/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    private var ratindButtons = [UIButton]()
    
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    
    // Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
        
    }
    
    @objc private func pressButton(button: UIButton) {
        guard let index = ratindButtons.firstIndex(of: button) else {return}
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    

    private func setupButton() {
        
        for button in ratindButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratindButtons.removeAll()
        
        let bundel = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundel, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundel, compatibleWith: self.traitCollection)
        let hightlightedStar = UIImage(named: "hightlightedStar", in: bundel, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(hightlightedStar, for: .highlighted)
            button.setImage(hightlightedStar, for: [.highlighted, .selected])
            
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            ratindButtons.append(button)
        }
        
        updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        for (index, button) in ratindButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
}
