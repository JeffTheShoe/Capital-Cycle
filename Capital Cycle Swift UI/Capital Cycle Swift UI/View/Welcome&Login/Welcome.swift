//
//  Welcome.swift
//  Capital Cycle Swift UI
//
//  Created by Caden Kowalski on 4/22/21.
//

import SwiftUI

struct Welcome: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var user = User()
    @State var progressBarValue: Double
    @State var userAlreadyHasAccount = false
    @State var userCompletedSignUp = false

    var body: some View {
        
        GeometryReader { screen in
            
            VStack {
                
                if progressBarValue > 0 {
                    
                    ZStack(alignment: .leading) {
                                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 12.5)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .cornerRadius(10)
                        
                        Rectangle()
                            .frame(maxWidth: CGFloat((Double(screen.size.width) - 32) * Double(progressBarValue)), maxHeight: 12.5)
                            .foregroundColor(.clear)
                            .background(Gradients.titleGradient)
                            .cornerRadius(10)
                    }
                    
                    .padding(.top, 50)
                    .padding([.leading, .trailing], 16)
                    .transition(.move(edge: .leading))
                }
                
                switch progressBarValue {
                
                    case 0.0:
                        
                        Intro(screen: screen)
                            .padding(.top, screen.safeAreaInsets.top + 32)
                        
                    case 0.2:
                        
                        Who()
                        
                    case 0.4:
                        
                        Info()
                        
                    case 0.6:
                        
                        ProfileImage()
                        
                    case 0.8:
                        
                        Verification()
                        
                    case 1.0:
                    
                        Complete()
                        
                    default:
                        
                        ProfileImage()
                }
                
                //Spacer()
                
                Button(action: {
                    
                   userCompletedSignUp = true
                }) {
                        
                    if progressBarValue == 0 {
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 45)
                                .background(Color(.gray))
                                .opacity(0.15)
                                .cornerRadius(8)
                            
                            Text("Continue Without an Account")
                                .font(Font.custom("Avenir-medium", size: 17))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                .padding([.leading, .trailing], 24)
                
                Button(action: {
                    
                    if progressBarValue == 1 {
                        
                        userCompletedSignUp = true
                        UserDefaults.standard.setValue(true, forKey: "userHasContinuedThroughWelcomePage")
                        
                    } else if progressBarValue == 0.4 {
                        
                        progressBarValue += 0.2
                    } else {
                        
                        progressBarValue += 0.2
                    }
                }) {
                    
                    if progressBarValue == 0 {
                        
                        Text("Create an Account")
                            .animation(.linear(duration: 0))
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 45)
                            .font(Font.custom("Avenir-medium", size: 17))
                            .background(Gradients.titleGradient)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    } else {
                        
                        Text("Continue")
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 45)
                            .font(Font.custom("Avenir-medium", size: 17))
                            .background(Gradients.titleGradient)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .transition(.move(edge: .top))
                    }
                }
                
                .shadow(color: Color("MidGradient"), radius: 10)
                .padding([.leading, .trailing], 24)
                .padding(.bottom, 8)
                
                Button(action: {
                    
                    userAlreadyHasAccount = true
                }) {
                    
                    if progressBarValue == 0 {
                        
                        Text("I already have an account")
                            .font(Font.custom("Avenir-Medium", size: 17))
                    }
                }
                
                .padding([.leading, .trailing], 24)
                .padding(.bottom, screen.safeAreaInsets.bottom + 16)
                
                .fullScreenCover(isPresented: $userAlreadyHasAccount) {
                                    
                        Login()
                }
                
                .fullScreenCover(isPresented: $userCompletedSignUp) {
                                    
                        TabController()
                }
            }
            
            .foregroundColor(Color("Label"))
            .background(Color("View"))
            .edgesIgnoringSafeArea(.all)
            //.statusBar(hidden: true)
            .animation(.linear(duration: 0.25))
        }
        
        .environmentObject(viewModel)
        .environmentObject(user)
    }
}

struct Welcome_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            /*Welcome(progressBarValue: 0)
                .previewDevice("iPhone 11 Pro Max")*/
            
            Welcome(progressBarValue: 0)
                .previewDevice("iPhone 11 Pro")
            
            Welcome(progressBarValue: 0)
                .previewDevice("iPhone 12 mini")
            
            Welcome(progressBarValue: 0)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
