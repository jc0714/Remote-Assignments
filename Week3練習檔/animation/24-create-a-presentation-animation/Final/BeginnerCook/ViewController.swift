import UIKit

final class ViewController: UIViewController {
  @IBOutlet private var background: UIImageView!

  @IBOutlet private var stackView: UIStackView! {
    didSet {
      for herb in Herb.all {
        let imageView = UIImageView( image: .init(herb: herb) )
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.widthAnchor.constraint(
          equalTo: imageView.heightAnchor,
          multiplier: UIScreen.main.bounds.width / UIScreen.main.bounds.height
        ).isActive = true
        stackView.addArrangedSubview(imageView)
        imageView.addGestureRecognizer(
          TapGestureRecognizer { [unowned self, unowned imageView] in
            self.selectedImage = imageView

            let herbDetails: HerbDetailsViewController = .instantiate {
              .init(coder: $0, herb: herb)
            }!
            herbDetails.transitioningDelegate = self
            self.present(herbDetails, animated: true)
          }
        )
      }
    }
  }

  private let popAnimator = PopAnimator()
  private(set) var selectedImage: UIImageView!
}

//MARK:- UIViewControllerTransitioningDelegate
extension ViewController: UIViewControllerTransitioningDelegate {
  func animationController(
    forPresented _: UIViewController, presenting _: UIViewController, source _: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {
    popAnimator.originFrame = selectedImage.superview!.convert(selectedImage.frame, to: nil)
    return popAnimator
  }

  func animationController(forDismissed _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    nil
  }
}

//MARK:- UIViewController
extension ViewController {
  override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

  override func viewWillTransition(
    to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator
  ) {
    super.viewWillTransition(to: size, with: coordinator)
    coordinator.animate(
      alongsideTransition: { _ in
        self.background.alpha = (size.width > size.height) ? 0.25 : 0.55
      }
    )
  }
}
