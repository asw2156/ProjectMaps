    import UIKit
    import FBSDKCoreKit
    import FBSDKLoginKit

    class FBViewController: UIViewController,FBSDKLoginButtonDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
        
        
        if(FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not logged in")
        }
        else {
            print("Logged in")
            }
            var loginButton = FBSDKLoginButton()
            loginButton.readPermissions = ["public_profile","email","user_friends"]
            loginButton.center = self.view.center
            loginButton.delegate = self
            self.view.addSubview(loginButton)
        }
        
        
        func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
            if(error == nil)
            {
            print("login complete")
                self.performSegueWithIdentifier("showSegue", sender: self)
            }
            else
            {
            print(error.localizedDescription)
            }
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
            print("User Logged Out")
        }
    }
