//
//  ViewController.swift
//  AppEjemplo
//
//  Created by Mac on 19/07/2022.
//  Copyright © 2022 Valeria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fechtDogApi()
    }

    func fechtDogApi() {
        API.shared.getDogAPI(onSuccess:{dogApiResponse in }  , onError: { error in})
    }
}


