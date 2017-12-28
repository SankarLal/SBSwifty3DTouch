
import UIKit

class SBShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem (image: UIImage(named: "Back"), style:.plain, target: self, action: #selector(SBShareViewController.performBackButton))
        self.title = "SBShareController"

    }
    
    @objc func performBackButton () {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
