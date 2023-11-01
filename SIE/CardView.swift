//
//  CardView.swift
//  SIE
//
//  Created by Fernanda M. Guzmán on 25/10/23.
//

import SwiftUI

// ===== Cargar una IMG de una URL =====
extension String {
    func loadImg() -> UIImage {
        do{
            // Convert IMG to URL
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data : Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {}
        
        return UIImage()
    }
}

struct CardView: View {
    
    var icon : String
    var id_iest : Int
    var full_name : String
    var email : String
    var career : String
    var index : Int
    
    @State var isVisible = false
    var image = "https://sie.iest.edu.mx/iestdesk/assets/images/elements/student.png"
    
    func onChangeImage() {
        self.isVisible = !isVisible
    }
    
    var body: some View {
        HStack(alignment: .top){
            VStack(){
                Button(action: {
                    onChangeImage()
                }) {
                    Image(uiImage: isVisible ? icon.loadImg() : image.loadImg())
                        .resizable()
                        .aspectRatio(contentMode: .fit )
                        .frame(width: 60, height: 60)
                        .cornerRadius(100)
                }
                
                Text(String(id_iest))
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
            
            HStack(){
                VStack(alignment: .leading, spacing: 5){
                    Text(full_name)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .padding(.top, 5)
                        .lineLimit(1)
                    Text(email)
                        .foregroundColor(Color("ColorYellow"))
                        .lineLimit(1)
                    Text(career)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(
            index % 2 == 0 ?
            Color("ColorBrown2") :
            Color("ColorBrown")
        )
        .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            icon: "https://i.pinimg.com/originals/66/cb/5b/66cb5bb2181b75445f39c4985385ac59.png",
            id_iest: 20644,
            full_name: "MARIAFERNANDA MENDOZA GUZMAN",
            email: "fernandaaa.mendozaa@iest.edu.mx",
            career: "INSD (2016)",
            index: 1
        )
        
    }
}
