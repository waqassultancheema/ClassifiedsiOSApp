# ClassifiedsiOSApp

It will fetch all classified List from API, that shows details when items on the list are tapped (a typical master/detail app) using clean architecture 

# Content


 * Structure Overview
 * How To Run
 * Unit Testing and Coverage
 * Screenshots
 * App Features
 
 
 # Structure Overview
 
 * **Configurator**: Contains **ClassifiedConfigurator** and **ClassifiedDetailConfigurator** files. Configurator intialize all clean archecture files. This part is optional we can do it view controller. I choose it because i feel it make more clean view controller. 
 * **Controller**: Contains **ClassifiedViewController** and **ClassifiedDetailViewController** component. Every controller is light weight controller. So they are extra files like **ClassifiedTableViewDataSource** and **ClassifiedDetailTableViewDataSource** 
 * **Helpers**: Contains files like constant and customcontrol that are essential and very helpful. 
 
 * **Interactor**: Contains **ClassifiedViewInteractor** and **ClassifiedDetailViewInteractor** files. Interactor is handling all business logic and it is also working with viewcontroller and worker to populate required information into viewcontrollers 
 * **Models**: Contains **BusinessModel** and **ViewModels** files. 
 * **Presentor**: Contains **ClassifiedViewPresentor** and **ClassifiedDetailViewPresentor** files. Presentor is handling all presntation logic of viewcontrollers
  * **Router**: Contains **ClassifiedAppRouter** which allow to navigate to detail screen. It is also communicating with interactor to send required info to detail interactor. 
  * **Storboard**: Contains **Main** storyboard and default **launchScreen**.
   
  * **WebApi**: WebiApi component is responsible for all network calls and cache of network calls. I have LRUCache which is using linklist as data structure
  * **Worker**: Worker is responsable for handling remote calling.

# How To run

To run the project just open .xcworkspace and click on the run button. You need to install pods to run the project

# Unit Testing and Coverage
To run unit test. Open .xcworkspace and click on Test navigator and press play button. For generating code coverage report we need to enable code coverage from edit scheme. Screen shot is attached for more clarification. 

<img width="500" alt="Screen Shot 2019-09-13 at 10 11 47 PM" src="https://user-images.githubusercontent.com/13622096/100767292-6947b300-341b-11eb-9741-ec856de36896.png">

To see the code coverage we need to go to report navigator and click on coverage.

<img width="500" alt="Screen Shot 2019-09-14 at 2 40 45 PM" src="https://user-images.githubusercontent.com/13622096/64906960-ba2b9880-d6fd-11e9-90f8-e8c7a622ed29.png">




# Screenshots
<img width="300" alt="Screen Shot 2019-09-14 at 2 40 45 PM" src="https://user-images.githubusercontent.com/13622096/100767495-aad85e00-341b-11eb-8311-b650edcacc65.png">
<img width="300" alt="Screen Shot 2019-09-14 at 2 40 45 PM" src="https://user-images.githubusercontent.com/13622096/100767715-e5da9180-341b-11eb-9a84-9cdc1d65dee5.png">



# AppFeature
  *Clean Architecture 
  *AutoLayout
  
