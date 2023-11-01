//
//  ContentView.swift
//  SIE
//
//  Created by Fernanda M. Guzmán on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    
    // Orientation
    @State private var orientation = UIDeviceOrientation.unknown
    @State var studentName: String = ""
    
    // Students Data
    let studentsViewModel = StudentModelView().dummyData()
    
    // URL Image
    let icon = "https://sie.iest.edu.mx/iestdesk/assets/images/elements/student.png"
    
    
    func setColumns() -> [GridItem] {
        
        if(orientation.isPortrait || orientation.rawValue == 0) {
            return [GridItem(.flexible())]
        }
        
        return [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
    }
    
    func onSearch() -> [Student]{
        
        if (!studentName.isEmpty) {
            return studentsViewModel.filter {
                $0.full_name.lowercased().contains( studentName.lowercased())
            }
        }
        
        return studentsViewModel
    }
    
    func setText() -> String {
        if(orientation.isPortrait || orientation.rawValue == 0) {
            return "\("Portrait")"
        }
        return "\(orientation.rawValue)"
    }
    
    var body: some View {
        VStack() {
            // SearchView
            SearchView(studentName: $studentName).padding(.bottom, 10)
            
            // List of Students
            ScrollView(){
                GeometryReader() { geometry in
                    LazyVGrid(columns: setColumns(), spacing: 10) {
                        
                        ForEach(
                            Array(onSearch().enumerated()),
                            id: \.offset
                        ) { index, student in
                            
                            // Text("\(setText())")
                            CardView(
                                icon: icon,
                                id_iest: student.id_iest,
                                full_name: student.full_name,
                                email: student.email,
                                career: student.career,
                                index: (index + 1)
                            )
                        }
                        
                    }
                }
            }
            
        }.onRotateDevice{
            newDeviceRotation in orientation = newDeviceRotation
        }
        .padding(.horizontal, 10)
        .padding(.top, 1)
        .background(Color.orange.opacity(0.8))
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
