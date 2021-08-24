//
//  UICollectionView.swift
//  InfluxProject
//
//  Created by SathizMacMini on 03/08/21.
//
import UIKit
public enum collectionCellID : String {
    case HomeVCCollectionViewCell = "HomeVCCollectionViewCell"
    case FooterReusableView = "FooterReusableView"
    
}

extension UICollectionView{
    
    
    func HomeVCCollectionViewCell(for indexPath : IndexPath)->HomeVCCollectionViewCell{
        return self.dequeueReusableCell(withReuseIdentifier: collectionCellID.HomeVCCollectionViewCell.rawValue, for: indexPath) as! HomeVCCollectionViewCell
    }
   
    
    //MARK:- Registering Cells
    
    public func registerCells(_ cell:[collectionCellID]){
        cell.forEach{registerCollectionCell(with: $0)}
    }
    public func forSupplementaryViewOfKind(_ cell:[collectionCellID]){
        cell.forEach{registerCollectionCellforSupplementaryViewOfKind(with: $0)}
    }
    
    
}

fileprivate extension UICollectionView{
    func registerCollectionCell(with id:collectionCellID){
        self.register(UINib(nibName: "\(id.rawValue)", bundle: nil), forCellWithReuseIdentifier: id.rawValue)
    }
    func registerCollectionCellforSupplementaryViewOfKind(with id:collectionCellID){
       
        
        self.register(UINib(nibName: "\(id.rawValue)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: id.rawValue)
    }
}


