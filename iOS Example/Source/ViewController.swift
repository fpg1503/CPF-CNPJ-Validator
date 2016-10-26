import UIKit
import CPF_CNPJ_Validator

class ViewController: UIViewController {
    @IBOutlet fileprivate var textField: UITextField?
    @IBOutlet fileprivate var label: UILabel?

    var text = "" {
        didSet {
            let success = BooleanValidator().validate(cpf: text)
            label?.text = success ? "CPF Válido" : "CPF Inválido"
        }
    }
}

extension ViewController {
    @IBAction func didChange() {
        text = textField?.text ?? ""
    }
}
