//
//  File.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/26/23.
//

import SwiftUI

// Custom SwiftUI View representing an Image Picker
struct ImagePicker: UIViewControllerRepresentable {
    // Binding for the selected image
    @Binding var selectedImage: UIImage?
    // Access to the presentation mode for dismissing the picker
    @Environment(\.presentationMode) var presentationMode
    // Coordinator creation method
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    // Creates and returns a UIImagePickerController
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    // Required method for protocol conformance, but no update needed in this case
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

// Extension for ImagePicker containing the Coordinator class
extension ImagePicker {
    // Coordinator class to handle UIImagePickerControllerDelegate methods
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        // Reference to the parent ImagePicker
        let parent: ImagePicker
        // Coordinator initialization
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        // Method called when an image is picked
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            // Extract the picked image from the info dictionary
            guard let image = info[.originalImage] as? UIImage else { return }
            // Set the selected image in the parent ImagePicker
            parent.selectedImage = image
            // Dismiss the ImagePicker
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
