//
//  ContentView.swift
//  ArcMenuAnimation
//
//  Created by Maxim Macari on 19/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var FABOpen: Bool = false
    @State var showButtons: Bool = false
    
    @State private var  showAlert = false
    @State private var selectedButton = ""
    
    var body: some View {
        ScrollView{
            
            Spacer()
            
            HStack{
                ZStack{
                    ExpandableButtonPanel(primaryItem: ExpandableButtonItem(label: "plus"), secondaryItems: [
                        ExpandableButtonItem(label: "pencil", action: {
                            self.showAlert.toggle()
                            self.selectedButton = "pencil"
                            print("pencil")
                        }),
                        ExpandableButtonItem(label: "trash", action: {
                            self.showAlert.toggle()
                            self.selectedButton = "trash"
                            print("trash")
                        })
                    ])
                }
            }
            
            Spacer(minLength: 200)
            
            
            HStack{
                
                
                ZStack() {
                    
                    GeometryReader { reader in
                        ForEach(0...2, id: \.self) { i in
                            
                            VStack{
                                Button(action: {
                                    self.showAlert.toggle()
                                    self.selectedButton = String(i)
                                    print("\(i)")
                                }, label: {
                                    Text("\(i)")
                                        .font(.title)
                                        .foregroundColor(Color.primary)
                                        .frame(width: 55, height: 55)
                                        .background(Color(.systemIndigo))
                                        .clipShape(Circle())
                                    
                                })
                                
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .rotationEffect(showButtons ? .degrees(Double(i) * -45) : .degrees(Double(-90)))
                            .zIndex(2)
                            
                            
                        }
                        .padding((reader.size.height - reader.size.width) / 2)
                        
                    }
                    .rotationEffect(.init(degrees: 0))
                    .opacity(showButtons ? 1 : 0)
                    .disabled(showButtons ? false : true)
                    
                    Circle()
                        .frame(width: 55, height: 55)
                        .foregroundColor(FABOpen ? Color.red : Color.green)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.title2)
                                .rotationEffect(.degrees(FABOpen ? 45 : 0))
                        )
                        .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6))
                        .onTapGesture {
                            withAnimation(.spring()){
                                self.FABOpen.toggle()
                                self.showButtons.toggle()
                            }
                        }
                }
                .frame(alignment: .top)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Selected button"), message: Text("\(self.selectedButton)"))
                }
            }
            .frame(alignment: .center)
            .padding()
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

