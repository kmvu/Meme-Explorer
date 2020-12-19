//
//  AddCommentView.swift
//  MemeExplorer
//
//  Created by Khang Vu on 15/11/20.
//

import SwiftUI

// MARK: - Add Comment button

struct AddComment: View {
    var hint: String
    var buttonTitle: String
    
    @Binding var value: String
    @State var shouldHide: Bool = false
    @State var isEdited: Bool = false
    
    var onCommit: () -> Void
    
    var body: some View {
        if shouldHide {
            Text("\(isEdited ? "Edit" : "Add") \(buttonTitle) \(Image(systemName: "plus.bubble"))")
                .onTapGesture { toggleTextField() }
                .cornerRadius(10.0)
                .foregroundColor(.blue)
        } else {
            Placeholder(hint: hint,
                        commit: finishedComment,
                        text: $value)
        }
    }
    
    func finishedComment() {
        defer { onCommit() } // Callback to respective Overlay owner
        
        toggleTextField()
        isEdited = value.isEmpty == false
    }
    
    func toggleTextField() {
        withAnimation { shouldHide.toggle() }
    }
}

// MARK: - Placeholder

struct Placeholder: View {
    var hint: String
    var commit: () -> Void
    
    @Binding var text: String
    
    var body: some View {
        TextField(hint,
                  text: $text,
                  onEditingChanged: { changed in debugPrint("\(changed)") },
                  onCommit: commit)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

// MARK: - Overlay

struct MemeOverlay: View {
    var isTop = false
    
    @Binding var value: String
    var onCommit: () -> Void
    
    var body: some View {
        AddComment(hint: isTop ? "Top Placeholder" : "Bottom Placeholder",
                   buttonTitle: isTop ? "top comment" : "bottom comment",
                   value: $value,
                   shouldHide: true,
                   onCommit: onCommit)
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(10.0)
            .padding(.vertical)
    }
}

// MARK: - Previews

struct AddComment_Previews: PreviewProvider {
    static var previews: some View {
        AddComment(hint: "Top Placeholder",
                   buttonTitle: "Add top comment",
                   value: .constant(""),
                   onCommit: {})
    }
}
