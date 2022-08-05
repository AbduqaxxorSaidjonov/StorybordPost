//
//  HomeView.swift
//  StorybordPost
//
//  Created by Abduqaxxor on 25/7/22.
//

import Foundation

protocol HomeView{
    func onLoadPosts(posts: [Post])
    func onPostDelete(deleted: Bool)
}
