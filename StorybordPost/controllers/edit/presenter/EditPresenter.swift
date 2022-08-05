//
//  EditPresenter.swift
//  StorybordPost
//
//  Created by Abduqaxxor on 5/8/22.
//

import Foundation
import UIKit

protocol EditPresenterProtocol{
    func apiSinglePost(id: String)
    func apiPostUpdate(id: String, post: Post)
}

class EditPresenter: EditPresenterProtocol{
    
    var editView: EditView!
    var controller: BaseViewController!
    
    func apiSinglePost(id: String){
        controller?.showProgress()
        AFHttp.get(url: AFHttp.API_POST_SINGLE + id, params: AFHttp.paramsPostWith(id: id), handler: {response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                let decode = try! JSONDecoder().decode(Post.self, from: response.data!)
                self.editView.onCall(post: decode)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostUpdate(id: String, post: Post){
        controller?.showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + id, params: AFHttp.paramsPostUpdate(post: post), handler: {response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                self.editView.onEdited(status: true)
            case let .failure(error):
                print(error)
                self.editView.onEdited(status: false)
            }
        })
    }
}
