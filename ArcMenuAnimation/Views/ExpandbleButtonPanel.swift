//
//  ExpandbleButtonPanel.swift
//  ArcMenuAnimation
//
//  Created by Maxim Macari on 19/2/21.
//

import SwiftUI

struct ExpandableButtonPanel: View {
    
    let primaryItem: ExpandableButtonItem
    let secondaryItems: [ExpandableButtonItem]
    
    private let noop: () -> Void = {}
    private let size: CGFloat = 55
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            ForEach(secondaryItems) { item in
                Button(action: {
                    (item.action ?? noop)()
                    print("\(item.id.uuidString)")
                }, label: {
                    Image(systemName: item.label)
                        .foregroundColor(Color.primary)
                })
                .frame(
                    width: self.isExpanded ? self.size : 0,
                    height: self.isExpanded ? self.size : 0)
                .disabled(isExpanded ? false : true)
            }
            
            Button(action: {
                withAnimation{
                    self.isExpanded.toggle()
                }
                self.primaryItem.action?()
            }, label: {
                Image(systemName: primaryItem.label)
                    .foregroundColor(.primary)
            })
            .frame(width: size, height: size)
            
        }
        .background(Color(.systemIndigo))
        .cornerRadius(cornerRadius)
        .font(.title2)
        
        
    }
}

