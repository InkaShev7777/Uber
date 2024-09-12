//
//  SideMenuVeiw.swift
//  Uber
//
//  Created by Ilya Schevchenko on 12.09.2024.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isshow: Bool
    @State private var selectedOption: SideMenuOptionViewModel?
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture { isshow.toggle() }
            
            HStack {
                VStack(alignment: .leading, spacing: 1) {
                    SideMenuHeaderView()
                    
                    VStack(alignment: .leading) {
                        Text("Do more with your account")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        
                        Button {
                            selectedOption = .makeMoney
                        } label: {
                            SideMenuRowView(option: .makeMoney)
                        }
                        .foregroundStyle(Color.theme.primaryTextColor)
                        
                        Divider()
                    }
                    
                    VStack {
                        ForEach(SideMenuOptionViewModel.allCases.filter { $0.rawValue > 0 }) { option in
                            Button {
                                selectedOption = option
                            } label: {
                                SideMenuRowView(option: option)
                            }
                            .foregroundStyle(Color.theme.primaryTextColor)
                        }
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                }
                .padding()
                .frame(width: 270, alignment: .leading)
                .background(Color.theme.backgroundColor)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SideMenu(isshow: .constant(true))
}
