//
//  ViewControllers.swift
//  Protocols
//

import UIKit

class ViewControllerWithGenerics: UIViewController, PhotoHandlerWithGenericsParent
{
    var photoHandler: PhotoHandlerWithGenerics<ViewControllerWithGenerics>!
    
    @IBAction func showPhotos()
    {
        self.photoHandler.start()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.photoHandler = PhotoHandlerWithGenerics(parent: self)
    }
    
    //MARK: Photo Handler With Generics Parent
    func photoHandlerDidFinish(photo: UIImage?)
    {
        println("WITH GENERICS: Delegate called")
    }
}

class ViewControllerNoGenerics: UIViewController, PhotoHandlerNoGenericsParent
{
    var photoHandler: PhotoHandlerNoGenerics!
    
    @IBAction func showPhotos()
    {
        self.photoHandler.start()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.photoHandler = PhotoHandlerNoGenerics(parent: self)
    }
    
    //MARK: Photo Handler No Generics Parent
    func photoHandlerDidFinish(photo: UIImage?)
    {
        println("NO GENERICS: Delegate called")
    }
    
    func presentViewController(viewController: UIViewController)
    {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    func dismissViewController()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
