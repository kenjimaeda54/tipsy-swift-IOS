# Tipsy
Aplicativo para dividir conta do restaurente com amigos,existe a opcao de escolher desconto entre 0,10 e 20 por cento

# Motivacao
Apriticar o uso de segue, MVC


## Feature
- Usei o delegate UITextFieldDelegate, para funcionar corretamente precisa ativar a palavra reserva return key no story board
- Para mandar dados via segue, precisa  sobrescrever a  função prepare
- Todas as variáveis disponíveis na outra classe ficam disponíveis no  .destination
- Para destruir  a screen e retornar anterior usa o metodo  .dismiss

```swift

// classe que recebe
class ResultController: UIViewController {
	
	var totalAcount: String = ""
	var totalPeople: String = ""
	var totalDiscount: String = ""
	
	@IBOutlet weak var totalPerson: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		totalPerson.text = totalAcount
		descriptionLabel.text = "Split between \(String(describing: totalPeople)), with \(String(describing: totalDiscount) ) tip."
	}
	
	@IBAction func pressRecalculate(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
}


// classe de origem

class ViewController: UIViewController {

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constant.resultSegue  {
			let destination = segue.destination as! ResultController
			destination.totalAcount = 	resultModel.calculePerPerson()
			destination.totalDiscount = discountSelect ?? "0%"
			destination.totalPeople = countStepper.text ?? "0"
		}
		
	}

}

```
