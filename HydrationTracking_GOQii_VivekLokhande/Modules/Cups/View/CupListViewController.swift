//
//  CupListViewController.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//

import UIKit

class CupListViewController: UIViewController {
    
    @IBOutlet weak var cupCollectionView: UICollectionView!
    
    let viewModel = CupViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cupCollectionView.register(CupCollectionViewCell.nib, forCellWithReuseIdentifier: CupCollectionViewCell.id)
    }

}


extension CupListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CupCollectionViewCell
            .id, for: indexPath) as? CupCollectionViewCell else {
            fatalError()
        }
        cell.cupData = viewModel.cups[indexPath.row]
        return cell
    }
}


extension CupListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width/2 - 40
        let height = width + 44
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
}
