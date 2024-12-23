//
//  ViewController.swift
//  Clase42MiPrimeraAplicacion
//
//  Created by Escurra Colquis on 18/12/24.
//

import UIKit

//clase padre
class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField! //nombre
    @IBOutlet weak var lastNameTextField: UITextField! //apellido
    @IBOutlet weak var salaryTextField: UITextField! //salario
    @IBOutlet weak var resultTextView: UITextView! //resultado
    
    //Variable
    var name: String = "" //para el nombre
    var lastName: String = "" //para el apellido
    var salary: Double = 0.0 //para el salario
    var salaryTotal: Double = 0.0 //para el salario total
    var benefit: Double = 300.0 //para el beneficio
    
    //carga en memoria
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //imprimir
    func getData() {
        name = nameTextField.text ?? "" // le colocamos a la variable nombre lo que escribimos por el teclado del iphone
        lastName = lastNameTextField.text ?? "" // le colocamos a la variable apellido lo que escribimos por el teclado del iphone
        salary = Double(salaryTextField.text ?? "") ?? 0.0 // le colocamos a la variable salario lo que escribimos por el teclado del iphone
        salaryTotal = salary + benefit //como es Double ya que es operable vamos a sumar el salio y el beneficio
        resultTextView.text = "Nombre: \(name), \nApellido: \(lastName), \nSalario Total: \(salaryTotal)" //aca solo mostramos la información en el TextView
        hideKeyboard() //llamamos a la función para poder ocultar o cerrar el teclado
        goToResultScreen() //llamamos a la función para dirigirnos a la siguiente vista
    }
    
    //limpiar textos
    func clearTextField() {
        nameTextField.text = "" //nombre
        lastNameTextField.text = "" //apellido
        salaryTextField.text = "" //salario
        resultTextView.text = "" //textView
        nameTextField.becomeFirstResponder() //focus al primer campo nombre
    }
    
    //función para ocultar o cerrar el teclado del iphone
    func hideKeyboard() {
        self.view.endEditing(true) //para cerrar el teclado
    }
    
    //función para enviar datos a otra vista
    func goToResultScreen() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil) //instanciar el storyboard llamado Main
        let viewController = storyboard.instantiateViewController(withIdentifier: "ScrenTwoViewController") as? ScrenTwoViewController //llamamos al identificador del ResultViewController
        viewController?.nameResult = name //le pasamos el nombre
        viewController?.lastNameResult = lastName //le pasamos el apellido
        viewController?.modalPresentationStyle = .overCurrentContext //presentar un estilo
        self.present(viewController ?? ViewController(), animated: true, completion: nil) //presentamos a la vista del ResultViewController
    }
    
    //función al hacer click en cualquier parte de la aplicación
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard() // llamar a la función
    }
    
    //acciones
    //botón imprimir
    @IBAction func didTapPrinter(_ sender: UIButton) {
        getData() //llamar a la función para obtener la información
    }
    
    //botón limpiar
    @IBAction func didTapClear(_ sender: UIButton) {
        clearTextField() //llamar  a la función para limpiar
    }
}
