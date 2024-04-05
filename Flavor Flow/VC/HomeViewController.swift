//
//  HomeViewController.swift
//  Flavor Flow
//
//  Created by Nishanththarun on 29/03/24.
//

import UIKit

class HomeViewController: UIViewController{

    
    
    
    @IBOutlet weak var RecipeCollectionView: UICollectionView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var filterArray:[Information] = arrayList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeCollectionView.delegate = self
        RecipeCollectionView.dataSource = self
        SearchBar.delegate = self
        RecipeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
}

extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let result = filterArray[indexPath.row]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let recipeVC = storyBoard.instantiateViewController(identifier: "RecipeViewController") as! RecipeViewController
        recipeVC.lab = result.Title ?? ""
        recipeVC.img = result.ImageName ?? ""
        recipeVC.dishlab = result.dish ?? ""
        self.navigationController?.pushViewController(recipeVC, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let result = filterArray[indexPath.row]
        let cell = RecipeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.RecipeTitle.text = result.Title
        cell.RecipeImage.image = UIImage(named: result.ImageName!)
       
        return cell
    }
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width:180, height: 170)
    }

}

extension HomeViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData(searchText: searchText)
    }

    func filterData(searchText: String) {
        filterArray = !searchText.isEmpty ? arrayList.filter({ (item) in
            item.Title?.lowercased().contains(searchText.lowercased()) == true
         }) : arrayList
        RecipeCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        RecipeCollectionView.reloadData()
        SearchBar.resignFirstResponder()
    }
    
    
}

