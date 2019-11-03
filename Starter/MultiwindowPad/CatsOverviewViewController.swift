//
//  CatsOverviewViewController.swift
//  MultiwindowPad
//
//  Created by Wals, Donny on 29/10/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import UIKit

class CatButton: UIView {

}

class CatsOverviewViewController: UIViewController {
  let cats = ["Misty", "Nala"]
  override func viewDidLoad() {
    super.viewDidLoad()

    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 8
    view.addSubview(stackView)

    for (index, cat) in cats.enumerated() {
      let image = UIImageView()
      image.tag = index
      image.isUserInteractionEnabled = true
      stackView.addArrangedSubview(image)

      image.translatesAutoresizingMaskIntoConstraints = false
      image.layer.cornerRadius = 6
      image.clipsToBounds = true
      NSLayoutConstraint.activate([
        image.widthAnchor.constraint(equalToConstant: 200),
        image.heightAnchor.constraint(equalToConstant: 200)])
      image.backgroundColor = .red
      
      image.image = UIImage(named: cat)

      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCat))
      image.addGestureRecognizer(tapGesture)
    }
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
  }

  func tappedCat(forRecognizer recognizer: UITapGestureRecognizer) -> String {
    let tappedIndex = recognizer.view?.tag ?? 0
    return cats[tappedIndex]
  }

  @objc func didTapCat(_ sender: UITapGestureRecognizer) {

  }
}
