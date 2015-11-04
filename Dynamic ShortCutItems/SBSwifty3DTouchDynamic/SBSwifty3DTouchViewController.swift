

import UIKit

class SBSwifty3DTouchViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        self.view.backgroundColor = UIColor.whiteColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "performSearchButton", name: "OpenSearchController", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "performShareButton", name: "OpenShareController", object: nil)

        self.title = "SBSwifty3DTouch"
        setUpUserInterface()
    }

    func setUpUserInterface () {
        
        let searchButton = UIButton (frame: CGRectMake(30, self.view.bounds.size.height/2 - 200, self.view.bounds.size.width - 60, 100))
        searchButton.setTitle("Search Button", forState: .Normal)
        searchButton.backgroundColor = UIColor.purpleColor()
        searchButton.addTarget(self, action: "performSearchButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(searchButton)
        
        
        let shareButton = UIButton (frame: CGRectMake(30, self.view.bounds.size.height - 200, self.view.bounds.size.width - 60, 100))
        shareButton.setTitle("Share Button", forState: .Normal)
        shareButton.backgroundColor = UIColor.orangeColor()
        shareButton.addTarget(self, action: "performShareButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(shareButton)

    }
    
    func performSearchButton () {
    
        self.navigationController?.pushViewController(SBSearchViewController(), animated: true)
        
    }
    
    func performShareButton () {
        
        self.navigationController?.pushViewController(SBShareViewController(), animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
