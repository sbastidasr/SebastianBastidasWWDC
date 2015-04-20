
import UIKit
import AVFoundation


class PianoViewController: UIViewController {
    
    var players:[AVAudioPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keys = ["C3", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
        for key in keys {
            let pianoSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(key, ofType: "mp3")!)
            let player = AVAudioPlayer(contentsOfURL: pianoSoundURL, error: nil)
            player.prepareToPlay()
            players.append(player)
        }
        
        
        
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)

    //    [self.navigationController setNavigationBarHidden:YES];
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @IBAction func playKey(sender: UIButton) {
        let keyTag = sender.tag
        players[keyTag].currentTime = 0
        players[keyTag].play()
    }
    
    /*
   
    //Delegate
    - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
    return YES;
    }
    return NO;
    }
    */
   
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:

                if let navController = self.navigationController {
                    navController.popViewControllerAnimated(true)
                }
            case UISwipeGestureRecognizerDirection.Left:
                    
                    if let navController = self.navigationController {
                        
                     self.performSegueWithIdentifier("next", sender: self)
                }
            case UISwipeGestureRecognizerDirection.Down:
                println("Swiped down")
            default:
                break
            }
        }
    }
    


    
    

}

