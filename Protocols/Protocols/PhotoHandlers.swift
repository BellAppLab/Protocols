//
//  PhotoHandler.swift
//  Protocols
//
//

import UIKit
import MobileCoreServices

class PhotoHandlerWithGenerics<Parent where Parent: UIViewController, Parent: PhotoHandlerWithGenericsParent>: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    private weak var parent: Parent!
    
    convenience init(parent: Parent)
    {
        self.init()
        self.parent = parent
    }
    
    func start()
    {
        var imageVC = UIImagePickerController()
        imageVC.delegate = self
        imageVC.mediaTypes = [kUTTypeImage]
        
        self.parent.presentViewController(imageVC, animated: true, completion: nil)
    }
    
    //MARK: Image Picker Controller Delegate
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        self.parent.photoHandlerDidFinish(info[UIImagePickerControllerOriginalImage] as? UIImage)
        self.parent.dismissViewControllerAnimated(true, completion: nil)
    }
}

class PhotoHandlerNoGenerics: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    private weak var parent: PhotoHandlerNoGenericsParent!
    
    convenience init(parent: PhotoHandlerNoGenericsParent)
    {
        self.init()
        self.parent = parent
    }
    
    func start()
    {
        var imageVC = UIImagePickerController()
        imageVC.delegate = self
        imageVC.mediaTypes = [kUTTypeImage]
        
        self.parent.presentViewController(imageVC)
    }
    
    //MARK: Image Picker Controller Delegate
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        self.parent.photoHandlerDidFinish(info[UIImagePickerControllerOriginalImage] as? UIImage)
        self.parent.dismissViewController()
    }
}

protocol PhotoHandlerWithGenericsParent: NSObjectProtocol
{
    func photoHandlerDidFinish(photo: UIImage?)
}

protocol PhotoHandlerNoGenericsParent: NSObjectProtocol
{
    func photoHandlerDidFinish(photo: UIImage?)
    func presentViewController(viewController: UIViewController)
    func dismissViewController()
}
