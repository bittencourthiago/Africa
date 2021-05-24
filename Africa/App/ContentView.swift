//
//  ContentView.swift
//  Africa
//
//  Created by Thiago on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    //MARK: - Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        //ToolBar Image
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
            break
        case 2:
            toolBarIcon = "square.grid.3x2"
            break
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
            break
        default:
            toolBarIcon = "square.grid.2x2"
            break
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: Link
                        }//: Loop
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: Link
                            }//: Loop
                        }//: Grid
                        .padding(10)
                        .animation(.easeIn)
                    }//: Scroll
                }//: Condition
            }//: Group
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button(action: {
                            print("List view activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        // Grid
                        Button(action: {
                            print("Grid view activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HStack
                }//: Buttons
            })//: ToolBar
        }//: Navigation
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
