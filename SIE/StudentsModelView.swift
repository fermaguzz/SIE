//
//  StudentsModelView.swift
//  SIE
//
//  Created by Fernanda M. Guzmán on 25/10/23.
//


import Foundation

struct StudentModelView {
    
    func dummyData() -> [Student] {
        
        let students: [Student] = [
            Student(id_iest: 20644, full_name: "MARIA FERNANDA MENDOZA GUZMAN", email: "fernanda.mendoza@iest.edu.mx", career: "ISND (2016)"),
            Student(id_iest: 20734, full_name: "ANDREA SOSA SALAZAR", email: "andrea.salaazar@iest.edu.mx", career: "ISND (2016)"),
            Student(id_iest: 19475, full_name: "TERESA LISETTE RICO SOTO", email: "teresa.rico@iest.edu.mx", career: "ISND (2016)"),
            Student(id_iest: 18432, full_name: "OSCAR ADRIAN GONZALEZ RASTRA", email: "oscar.lastra@iest.edu.mx", career: "ISND (2016)"),
        ]
        
        return students
    }
}
