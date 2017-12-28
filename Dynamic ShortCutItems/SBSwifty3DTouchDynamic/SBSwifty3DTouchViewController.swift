

import UIKit

class SBSwifty3DTouchViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        self.view.backgroundColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(SBSwifty3DTouchViewController.performSearchButton), name: NSNotification.Name(rawValue: "OpenSearchController"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SBSwifty3DTouchViewController.performShareButton), name: NSNotification.Name(rawValue: "OpenShareController"), object: nil)

        self.title = "SBSwifty3DTouch"
        setUpUserInterface()
    }

    func setUpUserInterface () {
        
        let searchButton = UIButton (frame: CGRect(x: 30, y: self.view.bounds.size.height/2 - 200, width: self.view.bounds.size.width - 60, height: 100))
        searchButton.setTitle("Search Button", for: UIControlState())
        searchButton.backgroundColor = UIColor.purple
        searchButton.addTarget(self, action: #selector(SBSwifty3DTouchViewController.performSearchButton), for: .touchUpInside)
        self.view.addSubview(searchButton)
        
        
        let shareButton = UIButton (frame: CGRect(x: 30, y: self.view.bounds.size.height - 200, width: self.view.bounds.size.width - 60, height: 100))
        shareButton.setTitle("Share Button", for: UIControlState())
        shareButton.backgroundColor = UIColor.orange
        shareButton.addTarget(self, action: #selector(SBSwifty3DTouchViewController.performShareButton), for: .touchUpInside)
        self.view.addSubview(shareButton)

    }
    
    @objc func performSearchButton () {
    
        self.navigationController?.pushViewController(SBSearchViewController(), animated: true)
        
    }
    
    @objc func performShareButton () {
        
        self.navigationController?.pushViewController(SBShareViewController(), animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
