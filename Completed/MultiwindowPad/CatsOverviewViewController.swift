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

      let dragInteraction = UIDragInteraction(delegate: self)
      image.addInteraction(dragInteraction)
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
    let activity = NSUserActivity(activityType: "com.donnywals.viewCat")
    activity.targetContentIdentifier = tappedCat(forRecognizer: sender)

    let session = UIApplication.shared.openSessions.first { openSession in
      guard let sessionActivity = openSession.scene?.userActivity,
        let targetContentIdentifier = sessionActivity.targetContentIdentifier  else {

          return false
      }

      return targetContentIdentifier == activity.targetContentIdentifier
    }

    UIApplication.shared.requestSceneSessionActivation(session, userActivity: activity, options: nil, errorHandler: nil)
  }
}

extension CatsOverviewViewController: UIDragInteractionDelegate {
  func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
    let selectedCat = cats[interaction.view?.tag ?? 0]

    let userActivity = NSUserActivity(activityType: "com.donnywals.viewCat")
    userActivity.targetContentIdentifier = selectedCat
    userActivity.title = "View Cat"

    let itemProvider = NSItemProvider(object: UIImage(named: selectedCat)!)
    itemProvider.registerObject(userActivity, visibility: .all)

    let dragItem = UIDragItem(itemProvider: itemProvider)
    dragItem.localObject = selectedCat

    return [dragItem]
  }
}
