//
//  ViewController.swift
//  Porshe
//
//  Created by Admin on 14/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var porsche = [Car]()
    var filteredCar = [Car]()
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        initAudio()
        parsePokemosCSV()
    }
    
    func initAudio(){
        let path = NSBundle.mainBundle().pathForResource("porsche", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
            print (err.debugDescription)
        }
    }
    
    func parsePokemosCSV(){
        let path = NSBundle.mainBundle().pathForResource("porsche", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let carId = Int (row["id"]!)!
                let name = row["identifier"]!
                let horsePower = row["power"]!
                let acceleration = Double(row["acceleration"]!)!
                let topSpeed = Int(row["top_speed"]!)!
                let fuel = Double(row["fuel"]!)!
                let price = row["price"]!
                
                
                let porh = Car(name: name, carId: carId, horsePower: horsePower, acceleration: acceleration, topSpeed: topSpeed, fuel: fuel, price: price)
                porsche.append(porh)
            }
            
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CarCell", forIndexPath: indexPath) as? CarCellVC {
            
            let porh:Car!
            if inSearchMode {
                porh = filteredCar[indexPath.row]
            } else {
                porh = porsche[indexPath.row]
            }
            
            
            
            cell.configureCell(porh)
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var porh:Car!
        
        if inSearchMode {
            porh = filteredCar[indexPath.row]
        } else {
            porh = porsche[indexPath.row]
        }
        
        performSegueWithIdentifier("PorscheDetailVC", sender: porh)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode{return filteredCar.count}
        return porsche.count
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath)->CGSize{
        
        return CGSizeMake(283, 133)
    }
    @IBAction func musicBtnPressed(sender: UIButton!) {
        
        if musicPlayer.playing{
            musicPlayer.stop()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode=false
            view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredCar = porsche.filter({$0.name.lowercaseString.rangeOfString(lower) != nil})
            collection.reloadData()
            
        }
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if 	segue.identifier == "PorscheDetailVC" {
            if let detailsVC = segue.destinationViewController as? PorscheDetailVC {
                if let porh = sender as? Car {
                    detailsVC.porsche = porh
                }
            }
        }
    }
}
