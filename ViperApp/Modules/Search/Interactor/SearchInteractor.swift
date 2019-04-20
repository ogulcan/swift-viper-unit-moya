//
//  SearchInteractor.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

class SearchInteractor: PresenterToInteractorSearchProtocol {
    
    var closure: SimpleClosure?
    var presenter: InteractorToPresenterSearchProtocol?
    
    func retrieveActor(with p: String) {
        self.closure?()
        self.closure = Run.afterDelay(0.2, block: {
            BaseService<TMDbApi, [Actor]>().call(.searchActors(p: p), completion: { actors in
                guard let actors = actors else {
                    self.presenter?.retrieveFail(message: "")
                    return
                }
                
                self.presenter?.retrieveSuccess(items: actors)
            })
        })
    }
}
