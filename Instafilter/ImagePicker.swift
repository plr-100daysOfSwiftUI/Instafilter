//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Paul Richardson on 02.09.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		let parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let uiImage = info[.originalImage] as? UIImage {
				parent.image = uiImage
			}
			
			parent.presentationMode.wrappedValue.dismiss()
		}
		
	}
	
	@Environment(\.presentationMode) var presentationMode
	@Binding var image: UIImage?
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}

	// why not use the typealias? - context: Context
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
		
	}
	
}
