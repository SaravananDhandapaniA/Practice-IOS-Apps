//
//  OnboardViewController.swift
//  Sample-ViewTransistion
//
//  Created by Tringapps on 20/04/22.
//

import UIKit

class OnboardViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Finished", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    var slides : [OnboardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [
            OnboardModel(title: "Welcome Makkale",description: "Sapdalam vaanga" ,image: #imageLiteral(resourceName: "slide1")),
            OnboardModel(title: "Make your Order", description: "Innaaiku enna order panna poringa",image: #imageLiteral(resourceName: "slide2")),
            OnboardModel(title: "Free Delivery", description: "Nambi vaanga sandhosama ponga",image: #imageLiteral(resourceName: "slide3")),
        ]
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            print("It is in the last page")
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardCollectionViewCell", for: indexPath) as! OnboardCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
    }
}

