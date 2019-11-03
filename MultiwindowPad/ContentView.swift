//
//  ContentView.swift
//  MultiwindowPad
//
//  Created by Wals, Donny on 25/10/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      PicturesListView()
      PictureView(image: nil)
    }
  }
}

struct ImageItem: Identifiable {
  var id: String { name }

  let name: String
  var image: Image {
    return Image(name)
  }
}

struct PicturesListView: View {
  let images = ["img_1", "img_2", "img_3"].map(ImageItem.init(name:))

  var body: some View {
    List(images) { image in
      NavigationLink(destination: PictureView(image: image)) {
        HStack {
          //Image(image)
          Text(image.name)
        }
      }
      }.navigationBarTitle("Pictures")
  }
}

struct PictureView: View {
  let image: ImageItem?

  var body: some View {
    Text("Picture \(image?.name ?? "unkown")")
  }
}
