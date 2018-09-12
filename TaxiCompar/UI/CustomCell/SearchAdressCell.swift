//
//  AdressSearchCell.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 09/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import UIKit

protocol TextFieldResult: class {
    func didEndEditing(id: Int, string: String)
    func didStartEditing(id: Int)
}

class SearchAdressCell: UITableViewCell {
    
    @IBOutlet private weak var imageSearch: UIImageView!
    @IBOutlet private weak var textFieldSearch: UITextField!
    
    static let identifier: String = "SearchAdressCell"

    weak var textFieldResultDelegate: TextFieldResult?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(imageSearch: UIImage) {
        self.imageSearch.image = imageSearch
    }
}

extension SearchAdressCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        textFieldResultDelegate?.didEndEditing(string: text)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
    }
    
}
