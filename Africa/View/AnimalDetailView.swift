//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Thiago on 23/05/21.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - Properties
    
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                
                //Healine
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    HeadingView(headingimage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // Facts
                Group {
                    HeadingView(headingimage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // Description
                Group {
                    HeadingView(headingimage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // Map
                Group {
                    HeadingView(headingimage: "map", headingText: "Nation Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // Link
                Group {
                    HeadingView(headingimage: "books.vertical", headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }//: VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//: Scroll
    }
}
//MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        
    }
}
