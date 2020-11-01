//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 周社军 on 2020/10/30.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
//            List(landmarkData) { landmark in
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(
//                        destination: LandmarkDetail(landmark: landmark)) {
//                        LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Landmarks"))
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(UserData())
    }
}
