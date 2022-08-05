//
//  CreateViewController.swift
//  StorybordPost
//
//  Created by Abduqaxxor on 18/7/22.
//

import UIKit

class CreateViewController: BaseViewController, CreateView {
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    var presenter: CreatePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    func initViews(){
        initNavigation()
        presenter = CreatePresenter()
        presenter.createView = self
        presenter.controller = self
        
    }
  
    func onCreatePosts(status: Bool) {
        if status {
            navigationController?.popViewController(animated: true)
        }else{
            //error
        }
    }
    
    func initNavigation(){
        let back = UIImage(named: "ic_back")
        let add = UIImage(systemName: "square.and.arrow.up")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
        title = "Create Post"
    }

    @objc func leftTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func rightTapped(){
        presenter?.apiPostCreate(post: Post(title: titleTextField.text!, body: bodyTextField.text!))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
}
