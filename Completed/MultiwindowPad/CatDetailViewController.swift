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
    stackView.alignment = .center
    view.addSubview(stackView)
    
    let topImage = mainImage()
    stackView.addArrangedSubview(topImage)
    
    let label = UILabel()
    label.text = catName
    stackView.addArrangedSubview(label)

    let wideImage = subImage(width: 424, height: 238, suffix: 1)
    stackView.addArrangedSubview(wideImage)
    
    let subStackView = UIStackView()
    subStackView.axis = .horizontal
    subStackView.spacing = 8
    stackView.addArrangedSubview(subStackView)
    
    let leftImage = subImage(width: 212, height: 282, suffix: 2)
    let rightImage = subImage(width: 212, height: 282, suffix: 3)
    subStackView.addArrangedSubview(leftImage)
    subStackView.addArrangedSubview(rightImage)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
  }
  
  func mainImage() -> UIImageView {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalToConstant: 150),
      image.heightAnchor.constraint(equalToConstant: 150)])
    image.image = UIImage(named: catName)
    
    image.layer.cornerRadius = 6
    image.clipsToBounds = true
    
    image.isUserInteractionEnabled = true
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(close))
    image.addGestureRecognizer(tapGesture)
    
    return image
  }
  
  func subImage(width: CGFloat, height: CGFloat, suffix: Int) -> UIImageView {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    
    image.layer.cornerRadius = 6
    image.clipsToBounds = true
    
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalToConstant: width),
      image.heightAnchor.constraint(equalToConstant: height)])
    image.image = UIImage(named: catName+"_\(suffix)")
    
    return image
  }

  @objc func close() {
    if let session = self.view.window?.windowScene?.session {
      let options = UIWindowSceneDestructionRequestOptions()
      options.windowDismissalAnimation = .commit
      UIApplication.shared.requestSceneSessionDestruction(session, options: options, errorHandler: nil)
    }
  }
}
