
//
//
//  CollectionViewExtension.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//
import UIKit
public enum collectionCellID : String {
    case VehicleTypeCell = "VehicleTypeCell"
    
}

extension UICollectionView{
    

    func VehicleTypeCell(for indexPath : IndexPath)->VehicleTypeCell{
        return self.dequeueReusableCell(withReuseIdentifier: collectionCellID.VehicleTypeCell.rawValue, for: indexPath) as! VehicleTypeCell
    }
//
    
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


