//
//  ScrenTwoViewController.swift
//  Clase42MiPrimeraAplicacion
//
//  Created by Escurra Colquis on 18/12/24.
//

import UIKit

//clase padre
class ScrenTwoViewController: UIViewController {
    //componentes de la UI
    @IBOutlet weak var nameResultLabel: UILabel! //campo de texto nombre
    @IBOutlet weak var lastNameResultLabel: UILabel! //campo de texto apellido
    
    //variables
    var nameResult: String = "" //nombre
    var lastNameResult: String = "" //apellido
    
    //carga en memoria
    override func viewDidLoad() {
        super.viewDidLoad()
        getResultClient() //llamamos a la función resultado del cliente
    }
    
    //función del cliente
    func getResultClient() {
        nameResultLabel.text = "Nombre: \(nameResult)" //le seteamos el nombre
        lastNameResultLabel.text = "Apellido: \(lastNameResult)" //le seteamos el apellido
    }

    //acción para regresar a la vista anterior
    @IBAction func didTapReturn(_ sender: UIButton) {
        self.dismiss(animated: true) //para retornar a la vista anterior
    }
}
