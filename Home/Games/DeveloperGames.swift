//  DeveloperGames.swift
// Copyright © 2020 Darakson. All rights reserved.
//------------------------Refractor Status :Not Completed-----------------------------------------------
import UIKit
class DeveloperGames: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
        
    let imagArr = ["CarDaraksonIcon","YesOrNo-1","X and O-1","Cardsgame"]
    
    let textArr = ["Drive Car","Yes Or No","X and O","match game"]
    
    let GameNameArr = ["Drive car","GussMyMovie","TicTacToe","Match game"]
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let width =  (view.frame.size.width - 20  ) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.itemSize = CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
                return imagArr.count}
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
            
        cell?.imag.image = UIImage(named: imagArr[indexPath.row])
        cell?.Label.text = textArr[indexPath.row]
        cell?.Imag2.image = UIImage(named: GameNameArr[indexPath.row])
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  cell2 = collectionView.cellForItem(at: indexPath)
        let item = imagArr[indexPath.row]
        
        if item == "CarDaraksonIcon" {
            let storyboard = self.storyboard?.instantiateViewController(identifier: "Play") as! playview
                                                                 
                            self.navigationController?.pushViewController(storyboard, animated: true)
            
        }  else if item == "YesOrNo-1" {
            let storyboard = self.storyboard?.instantiateViewController(identifier: "YesOrNo") as! GussMyMovie
                                                                                
            self.navigationController?.pushViewController(storyboard, animated: true)
         }
       else if item == "X and O-1" {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "Play2") as!TicTacToe
                                                                            
          self.navigationController?.pushViewController(storyboard, animated: true)
       }
      else if item == "Cardsgame" {
         let storyboard = self.storyboard?.instantiateViewController(identifier: "Play3") as! CardMatchViewController
                                                                            
          self.navigationController?.pushViewController(storyboard, animated: true)
        }
    }

    }


