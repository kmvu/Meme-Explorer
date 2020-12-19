//
//  MemeDetailsScreen.swift
//  MemeExplorer
//
//  Created by Khang Vu on 15/11/20.
//

import SwiftUI

// MARK: - Details

struct MemeDetailsScreen: View {
    @StateObject var memeData: MemeData
    
    @State var topValue: String = ""
    @State var bottomValue: String = ""
    
    @State var showTopLabel: Bool = false
    @State var showBottomLabel: Bool = false
    
    var body: some View {
        VStack {
            MemeOverlay(isTop: true,
                        value: $topValue,
                        onCommit: onCommit)
            
            Image(memeData.image)
                .resizable()
                .scaledToFit()
                .overlay(MemeLabel(value: topValue.isEmpty
                                    ? "Top Label"
                                    : topValue,
                                   isShown: $showTopLabel),
                         alignment: .top)
                .overlay(MemeLabel(value: bottomValue.isEmpty
                                    ? "Bottom Label"
                                    : bottomValue,
                                   isShown: $showBottomLabel),
                         alignment: .bottom)
                .cornerRadius(4.0)
                .shadow(radius: 4.0)
                .padding(.horizontal)
            
            MemeOverlay(value: $bottomValue,
                        onCommit: onCommit)
        }
        .navigationTitle(memeData.title)
    }
    
    private func onCommit() {
        memeData.topValue = topValue
        memeData.bottomValue = bottomValue
        
        updateMemeLabels()
    }
    
    private func updateMemeLabels() {
        showTopLabel = memeData.topValue.isEmpty == false
        showBottomLabel = memeData.bottomValue.isEmpty == false
    }
}

struct MemeLabel: View {
    var value: String
    @Binding var isShown: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            if isShown {
                Text(value.uppercased())
                    .font(Font.custom("impact", size: 40.0))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
    }
}

#if DEBUG
struct MemeDetailsScreen_Previews: PreviewProvider {
    var title = "Khang"
    
    static var previews: some View {
        NavigationView {
            MemeDetailsScreen(memeData: testData[0])
        }
        .navigationBarTitle("Khang")
    }
}
#endif
