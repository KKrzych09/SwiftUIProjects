//
//  NewAlbumView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 05/08/2022.
//

import SwiftUI

struct NewAlbumView: View {
    
    @ObservedObject private var albumFormViewModel: AlbumFormViewModel
    
    init() {
        let viewModel = AlbumFormViewModel()
        viewModel.image = UIImage(named: "newphoto")!
        albumFormViewModel = viewModel
    }
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    
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
                    Image(uiImage: albumFormViewModel.image)
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
                    
                    FormTextField(label: "Name", placeholder: "Fill in the album name", value: $albumFormViewModel.name)
                    
                    FormTextField(label: "Artist Name", placeholder: "Fill in the artist name", value: $albumFormViewModel.artistName)
                    
                    FormTextField(label: "Address", placeholder: "Fill in the album address", value: $albumFormViewModel.location)
                    
                    FormTextField(label: "Phone", placeholder: "Fill in the label phone", value: $albumFormViewModel.phone)
                    
                    FormTextView(label: "Description", value: $albumFormViewModel.description, height: 100)
                    
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
                    Button(action: {
                        save()
                        dismiss()
                    }) {
                        Text("Save")
                            .font(.headline)
                            .accentColor(.primary)
                    }
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
            case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $albumFormViewModel.image).ignoresSafeArea()
                
            case .camera: ImagePicker(sourceType: .camera, selectedImage: $albumFormViewModel.image).ignoresSafeArea()
            }
        }
    }
    
    private func save() {
        let album = Album(context: context)
        
        album.name = albumFormViewModel.name
        album.artistName = albumFormViewModel.artistName
        album.location = albumFormViewModel.location
        album.phone = albumFormViewModel.phone
        album.image = albumFormViewModel.image.pngData()!
        album.summary = albumFormViewModel.description
        album.isFavorite = false
        
        do {
            try context.save()
        } catch {
            print("Failed to save the record...")
            print(error.localizedDescription)
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
