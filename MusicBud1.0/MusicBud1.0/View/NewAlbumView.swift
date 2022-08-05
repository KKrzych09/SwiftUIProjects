//
//  NewAlbumView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 05/08/2022.
//

import SwiftUI

struct NewAlbumView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var albumImage = UIImage(named: "newphoto")!
    @State private var showPhotoOptions = false
    
    enum PhotoSource: Identifiable {
        case photoLibrary
        case camera
        
        var id: Int {
            hashValue
        }
    }
    
    @State private var photoSource: PhotoSource?
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    Image(uiImage: albumImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                    
                    FormTextField(label: "Name", placeholder: "Fill in the album name", value: .constant(""))
                    
                    FormTextField(label: "Artist Name", placeholder: "Fill in the artist name", value: .constant(""))
                    
                    FormTextField(label: "Address", placeholder: "Fill in the album address", value: .constant(""))
                    
                    FormTextField(label: "Phone", placeholder: "Fill in the label phone", value: .constant(""))
                    
                    FormTextView(label: "Description", value: .constant(""), height: 100)
                    
                }
                .padding()
            }
            
            // Navigation bar configuration
            .navigationTitle("New Album")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .accentColor(.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
        .actionSheet(isPresented: $showPhotoOptions) {
            
            ActionSheet(title: Text("Choose your photo source"),
                        message: nil,
                        buttons: [
                            .default(Text("Camera")) {
                                self.photoSource = .camera
                            },
                            .default(Text("Photo Library")) {
                                self.photoSource = .photoLibrary
                            },
                            .cancel()
                        ])
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $albumImage).ignoresSafeArea()
                
            case .camera: ImagePicker(sourceType: .camera, selectedImage: $albumImage).ignoresSafeArea()
            }
        }
    }
}

struct NewAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        NewAlbumView()
        
        FormTextField(label: "NAME", placeholder: "Fill in the album name", value: .constant(""))
            .previewLayout(.fixed(width: 300, height: 200))
        
        FormTextView(label: "Description", value: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}

// MARK: Structs

struct FormTextField: View {
    
    let label: String
    var placeholder: String = ""
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            
            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.vertical, 10)
        }
    }
}

struct FormTextView: View {
    
    let label: String
    
    @Binding var value: String
    
    var height: CGFloat = 200.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            
            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.top, 10)
        }
    }
}
