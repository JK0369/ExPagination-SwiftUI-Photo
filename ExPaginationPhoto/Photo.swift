//
//  Photo.swift
//  ExPaginationPhoto
//
//  Created by 김종권 on 2022/09/25.
//

import UIKit

struct Photo: Identifiable {
  let url: String
  let uiImage: UIImage
  let width: CGFloat
  let height: CGFloat
}

extension Photo {
  var id: String { url }
}

extension Photo: Hashable {}
