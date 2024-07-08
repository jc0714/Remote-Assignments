import UIKit

final class HerbDetailsViewController: UIViewController {
  //MARK:- IBOutlets

  @IBOutlet var containerView: UIView!
  
  @IBOutlet var background: UIImageView!
  @IBOutlet var titleView: UILabel!
  @IBOutlet var descriptionView: UITextView!

  //MARK:-
  
  required init?(coder: NSCoder) { fatalError() }

  init(coder: NSCoder, herb: Herb) {
    self.herb = herb
    super.init(coder: coder)!
    modalPresentationStyle = .overFullScreen
  }

  let herb: Herb
}

//MARK: UIViewController
extension HerbDetailsViewController {
  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    background.image = UIImage(herb: herb)
    titleView.text = herb.name
    descriptionView.text = herb.description

    view.addGestureRecognizer(
      TapGestureRecognizer {
        [unowned presentingViewController = presentingViewController!] in
        presentingViewController.dismiss(animated: true)
      }
    )
  }
}

private extension HerbDetailsViewController {
  @IBAction func openLicense() {
    UIApplication.shared.open(URL(string: herb.license)!)
  }
  
  @IBAction func openCredit() {
    UIApplication.shared.open(URL(string: herb.credit)!)
  }
}
