//
//  ViewController.swift
//  delegatePractice
//
//  Created by Tringapps on 10/05/22.
//

import UIKit



class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {
    
    func didSelectedItem() {
            view.backgroundColor = .red
    }
    
    //private  var collectionView: UICollectionView?
    
    
    @IBOutlet  var collectionView: UICollectionView!
    
    let images = ["plus_image","image_mask","image_mask1","image_mask2","image_mask3","image_mask3"]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 150, height: 150)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
//        collectionView.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CircleCollectionViewCell
        cell.configure(with: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     //   let index = images[indexPath.row - 1]
    
        if (indexPath.row) == (images.count - 1) {
           didSelectedItem()
        }
        else{
                    guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
                        return
                    }
            
                    vc.selectedData = images[indexPath.row]
                    self.present(vc, animated: true, completion: nil)
        }
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
//            return
//        }
//
//        vc.selectedData = images[indexPath.row]
//        self.present(vc, animated: true, completion: nil)
        
       
    }

}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}

