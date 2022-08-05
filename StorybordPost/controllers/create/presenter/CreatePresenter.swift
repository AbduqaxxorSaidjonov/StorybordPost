//
//  CreatePresenter.swift
//  StorybordPost
//
//  Created by Abduqaxxor on 5/8/22.
//

import Foundation

protocol CreatePresenterProtocol{
    func apiPostCreate(post: Post)
}

class CreatePresenter: CreatePresenterProtocol{
    
    var createView: CreateView!
    var controller: BaseViewController!
    
    func apiPostCreate(post: Post){
        controller?.showProgress()
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print("SUCCESS")
                self.createView.onCreatePosts(status: true)
            case let .failure(error):
                print(error)
                self.createView.onCreatePosts(status: false)
            }
        })
    }
    
    
}
