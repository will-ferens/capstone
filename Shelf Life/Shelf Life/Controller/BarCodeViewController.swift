//
//  BarCodeViewController.swift
//  Shelf Life
//
//  Created by Will Ferens on 5/4/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire
import SwiftyJSON
class BarCodeViewController: UIViewController,  AVCaptureMetadataOutputObjectsDelegate {
    
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var searchedBook: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        dismiss(animated: true)
    }
    
    func found(code: String) {
        let GOOGLE_BOOKS = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(code)&key=AIzaSyAHWyKUtEptq99fnW9I7x2V7LOjrmgCnLk"
        getBooks(url: GOOGLE_BOOKS)
        print(code)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func getBooks(url: String) {
        Alamofire.request(url, method: .get).validate().responseJSON{
            response in
            if response.result.isSuccess {
                print("shit yeah")
                
                let booksJSON : JSON = JSON(response.result.value!)
            
                self.createNewBook(json: booksJSON)
                
                //print(booksJSON)
        
                
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
    
    func createNewBook(json : JSON){
        let id = json["items"][0]["id"].string
        let title = json["items"][0]["volumeInfo"]["title"].string
        let author = json["items"][0]["volumeInfo"]["authors"][0].string
        let pageCount = json["items"][0]["volumeInfo"]["pageCount"].int
        let cover = json["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"].string
        let description = json["items"][0]["volumeInfo"]["description"].string
        
        self.searchedBook = Book.init(id: id!, title: title!, author: author!, pageCount: pageCount!, cover: cover!, description: description!)
        
        self.alert(title: "Success!", message: "See book details?", completion: { result in
            if result {
        
                self.performSegue(withIdentifier: "searchDetails", sender: self)
            }
        })
    }
    
    
    func alert (title: String, message: String, completion: @escaping ((Bool) -> Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            
            alertController.dismiss(animated: true, completion: nil)
            completion(true) // true signals "YES"
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
            completion(false) // false singals "NO"
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchDetails" {
            let SearchVC = segue.destination as? SearchDetailsViewController
            SearchVC?.bookViewed = searchedBook
            
        }
    }
}
