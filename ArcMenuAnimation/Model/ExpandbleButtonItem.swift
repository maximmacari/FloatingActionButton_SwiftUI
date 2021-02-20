//
//  ExpandbleButtonItem.swift
//  ArcMenuAnimation
//
//  Created by Maxim Macari on 19/2/21.
//

import SwiftUI

struct ExpandableButtonItem: Identifiable {
  let id = UUID()
  let label: String
  private(set) var action: (() -> Void)?
}
