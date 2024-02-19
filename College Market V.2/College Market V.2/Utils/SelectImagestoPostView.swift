//
//  PostStructureView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/29/23.
//

import SwiftUI

struct PostStructureView: View {
    
    // State variable to control the presentation of the image picker
    @State private var isImagePickerPresented = false
    // Binding to track the selected images
    @Binding var selectedImages: [UIImage]
    
    // Subview responsible for displaying selected images in a TabView
    struct ImageGalleryView: View {
        // Binding to track the selected images
        @Binding var selectedImages: [UIImage]

        var body: some View {
            if !selectedImages.isEmpty {
                TabView {
                    // Display each selected image in a resizable, clipped, and rounded rectangle
                    ForEach(selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 364, height: 228)
                            .clipped()
                            .cornerRadius(25)
                    }
                }
                // Customize the TabView style
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            } else {
                // Display a message when no images are selected
                Text("No images selected")
            }
        }
    }
    
    var body: some View {
        VStack {
            // Button triggering the presentation of the image picker
            Button {
                isImagePickerPresented.toggle()
            } label: {
                ZStack {
                    // Container for the button with rounded corners and border
                    Rectangle()
                        .cornerRadius(25)
                        .frame(width: 365, height: 230)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding()
                    // Display a "plus" icon if no images are selected, else show the ImageGalleryView
                    if selectedImages.isEmpty {
                        Image(systemName: "plus")
                            .foregroundColor(Color(.systemBlue))
                            .padding()
                            .font(.largeTitle)
                    } else {
                        ImageGalleryView(selectedImages: $selectedImages)
                            .frame(width: 365, height: 230) // Match the button size
                            .clipped() // Ensure the images don't overflow the frame
                    }
                }
                // Present the image picker when the button is tapped
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePick(selectedImages: $selectedImages)
                }
                .padding()
            }
        }
    }
}
