//
//  ViewController.swift
//  WartopTask2
//
//  Created by Tringapps on 05/06/22.
//

import UIKit

class WartopViewControlleriPad: UIViewController {

    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var wartopImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var seeFullStoryButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    
    let viewModel = WartopViewModel()
    var verticalConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUP()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public var traitCollection: UITraitCollection {
        return updatedTraitCollection()
    }
    
//    static func warTopViewController() -> WartopViewControlleriPad? {
//        let storyBoard = UIStoryboard(name: String(describing: self), bundle: nil)
//        return storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as? WartopViewControlleriPad
//    }
    
    private func updatedTraitCollection() -> UITraitCollection {
        if  !Constant.ISLANDSCAPE {
            let current = super.traitCollection
            let compact = UITraitCollection(horizontalSizeClass: .compact)
            let regular = UITraitCollection(verticalSizeClass: .regular)
                   
            if Constant.CURRENTSYSTEMVERSION >= "13.0" {
                    return UITraitCollection(traitsFrom: [current, compact])
                }
                    return UITraitCollection(traitsFrom: [regular, compact])
            }
            return super.traitCollection
    }
    
    private func initialSetUP() {
        wartopImageView.translatesAutoresizingMaskIntoConstraints =  false
        verticalConstraint = NSLayoutConstraint(item: bottomView as Any,
                                                        attribute: NSLayoutConstraint.Attribute.topMargin,
                                                        relatedBy: NSLayoutConstraint.Relation.equal,
                                                        toItem: wartopImageView,
                                                        attribute: NSLayoutConstraint.Attribute.bottomMargin,
                                                        multiplier: 1, constant: 0)
        
        containerView.layer.cornerRadius = 10
        updateVerticalImageconstrainst()
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension WartopViewControlleriPad {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateVerticalImageconstrainst()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateVerticalImageconstrainst()

    }
    
    private func updateVerticalImageconstrainst() {
        view.removeConstraint(verticalConstraint)
        if !Constant.ISLANDSCAPE {
            view.addConstraint(verticalConstraint)
        }
    }
}

