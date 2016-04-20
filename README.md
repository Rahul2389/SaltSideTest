# SaltSideTest

The project is written in Objective C and have, StoryBoards for creating UI with Adaptive Layout and AFNetworking for Network calls.

2 Main controllers:

- ListViewController : Fetches Json Data fro the Data API given and populates the tableview.

- DetailViewController: Takes a Model object, displays the text and downloads image with resizing logic of image.

Things Used:
1. Adaptive Layout for UI
2. Third Party Library AFNetworking for API calls 
3. Cocoa Pods installed for AFNetworking 
4. Data Downloading
5. Image Downloading and Caching
6. Resizing of image in DetailViewController for maintaining the Aspect Ratio.
7. Error Handling, Reachability checks and showing of alerts where ever required
8. MVC
9. Categories for NSArray, NSDictionary, NSString, UILabel, UIImage
