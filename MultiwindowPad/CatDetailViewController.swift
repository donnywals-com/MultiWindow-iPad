//
//  CatDetailViewController.swift
//  MultiwindowPad
//
//  Created by Wals, Donny on 29/10/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import UIKit

class CatDetailViewController: UIViewController {
  let catName: String

  init(catName: String) {
    self.catName = catName
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("Not implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 8
    view.addSubview(stackView)

    let image = UIImageView()
    image.isUserInteractionEnabled = true
    stackView.addArrangedSubview(image)

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(close))
    image.addGestureRecognizer(tapGesture)

    image.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalToConstant: 100),
      image.heightAnchor.constraint(equalToConstant: 100)])
    image.backgroundColor = .blue

    let label = UILabel()
    label.text = catName
    stackView.addArrangedSubview(label)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
  }

  @objc func close() {
    if let session = self.view.window?.windowScene?.session {
      let options = UIWindowSceneDestructionRequestOptions()
      options.windowDismissalAnimation = .commit
      UIApplication.shared.requestSceneSessionDestruction(session, options: options, errorHandler: nil)
    }

    for session in UIApplication.shared.openSessions {
      if session.scene?.userActivity?.activityType == "some.activity.type" {
        UIApplication.shared.requestSceneSessionRefresh(session)
      }
    }
  }
}
