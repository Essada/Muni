//
//  ImagePickerGPT.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/29/23.
//


import Foundation
import UIKit
import SwiftUI

// Coordinator class to handle UIImagePickerControllerDelegate methods
class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // Binding for the selected images array
    @Binding var selectedImages: [UIImage]

    // Coordinator initialization
    init(selectedImages: Binding<[UIImage]>) {
        _selectedImages = selectedImages
    }

    // Method called when an image is picked
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Extract the picked image from the info dictionary
        if let pickedImage = info[.originalImage] as? UIImage {
            // Append the picked image to the selectedImages array
            selectedImages.append(pickedImage)
        }
        // Dismiss the ImagePicker
        picker.dismiss(animated: true, completion: nil)
    }

    // Method called when the user cancels image picking
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the ImagePicker
        picker.dismiss(animated: true, completion: nil)
    }
}

// SwiftUI View representing an Image Picker
struct ImagePick: UIViewControllerRepresentable {
    
    // Binding for the selected images array
    @Binding var selectedImages: [UIImage]

    // Required method for protocol conformance, but no update needed in this case
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePick>) {
        
    }

    // Creates and returns a UIImagePickerController configured for picking images from the photo library
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePick>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false // Set to true if you want to allow editing
        imagePicker.mediaTypes = ["public.image"]
        return imagePicker
    }

    // Required method for protocol conformance, but no update needed in this case
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    // Creates and returns the coordinator for the ImagePick
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(selectedImages: $selectedImages)
    }
}
