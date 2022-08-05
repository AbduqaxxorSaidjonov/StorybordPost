//
//  EditView.swift
//  StorybordPost
//
//  Created by Abduqaxxor on 5/8/22.
//

import Foundation

protocol EditView{
    func initViews()
    func onCall(post: Post)
    func onEdited(status: Bool)
}
