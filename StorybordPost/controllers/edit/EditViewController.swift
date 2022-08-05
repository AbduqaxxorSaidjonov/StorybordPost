//
//  EditViewController.swift
//  StorybordPost
//
//  Created by Abduqaxxor on 18/7/22.
//

import UIKit

class EditViewController: BaseViewController, EditView {
    
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editBody: UITextField!
    var presenter: EditPresenter!
    var POSTID: String = "1"
    var post : Post = Post()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigation()
    presenter?.apiSinglePost(id: POSTID)
    presenter = EditPresenter()
    presenter.editView = self
    presenter.controller = self
    }

    func initViews(){
        self.editBody.text = self.post.body
        self.editTitle.text = self.post.title
        
    }
    
    func initNavigation(){
        let back = UIImage(named: "ic_back")
        let add = UIImage(systemName: "square.and.arrow.down")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
        title = "Edit Post"
    }

    @objc func leftTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func rightTapped(){
        presenter?.apiPostUpdate(id: POSTID, post: Post(title: editTitle.text!, body: editBody.text!))
    }
    
    func onEdited(status: Bool) {
        if status{
            self.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "edit"), object: nil)
        }else{
            //error
        }
    }
    
    func onCall(post: Post) {
        if post != nil{
            self.post = post
            initViews()
        }else{
            //error
        }
    }
   
}
