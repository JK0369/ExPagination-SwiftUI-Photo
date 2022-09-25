//
//  ContentView.swift
//  ExPaginationPhoto
//
//  Created by 김종권 on 2022/09/25.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ContentViewModel()
  private var photoWidth: CGFloat {
    UIScreen.main.bounds.width
  }
  
  init() {
    viewModel.fetchPhoto()
  }
  
  var body: some View {
    NavigationView {
      getList()
        .navigationTitle("사진")
    }
  }
  
  @ViewBuilder
  private func getList() -> some View {
    ScrollView {
      LazyVStack {
        ForEach(viewModel.photos) { photo in
          NavigationLink(
            destination: {
              Image(uiImage: photo.uiImage)
                .resizable()
                .frame(
                  width: photoWidth,
                  height: getHeight(imageWidth: photo.width, imageHeight: photo.height)
                )
            },
            label: {
              Image(uiImage: photo.uiImage)
                .resizable()
                .frame(
                  width: photoWidth,
                  height: getHeight(imageWidth: photo.width, imageHeight: photo.height)
                )
            }
          )
        }
        if !viewModel.photos.isEmpty {
          HStack {
            Spacer()
            ProgressView()
              .onAppear {
                viewModel.fetchPhoto()
              }
            Spacer()
          }
        }
      }
    }
  }
  
  private func getHeight(imageWidth: Double, imageHeight: Double) -> Double {
    photoWidth * imageHeight / imageWidth
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
