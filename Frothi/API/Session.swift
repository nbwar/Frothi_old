class Session {
  class func login(params:[String:String], success:((AFHTTPRequestOperation,AnyObject) -> Void)!, failure:((AFHTTPRequestOperation, NSError) -> Void)! ) {
    let manager = AFHTTPRequestOperationManager()
    
    manager.POST("http://localhost:3000/api/login", parameters: params as AnyObject, success: { (operation: AFHTTPRequestOperation!,response: AnyObject!) in
      
      let token = response["token"] as? String
      CurrentUser.sharedInstance.setToken(token)
      
      success(operation, response)
      
    }, failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
      
      failure(operation, error)
      
    })
  }
  
}