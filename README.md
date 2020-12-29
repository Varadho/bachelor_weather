# Weather App

This Application is the basis for the comparison of state management methods in the Flutter Framework.
The compared libraries are:
* Provider
* Redux
* Bussines Logic Components (BLoCs)
* MobX

There is also an implementation using the basic state management already provided inside the Flutter Framework. (setState)

The code of the application is entirely located inside the /lib folder.
The code of the flutter_driver tests is located inside the /test_driver folder.

Each page (for every state management library) is laid out in the same way. This is meant to ensure comparability of the state management libraries.
This also reflects in the design of the Code.
If you find ways to improve on the code commonly used by all state management libraries, I'd be delighted to know.

Files located inside the /lib/ui/pages folder are only used by one state management library at a time.
All other files are either all used equally by the state management libraries or not used by any of them.

---

## How to Install the application:
1. Install the flutter framework as described [here](https://flutter.dev/docs/get-started/install)
2. Attach a device or start an emulator
2. Run ```flutter doctor``` from the command line to make sure everything is set up properly
3. Navigate to the root folder of this project from the command line
3. Run ```flutter pub get``` to ensure all dependencies are met
3. Start the application using ```flutter run``` (or use the built-in way depending on your IDE)

---
## Run the flutter driver tests
1. Install the flutter framework as described [here](https://flutter.dev/docs/get-started/install)
2. Attach a device (It is not advised to test performance on an emulator.)
2. Run ```flutter doctor``` from the command line to make sure everything is set up properly
1. Navigate to the root folder of this project from the command line
2. Run ```flutter drive --target=test_driver/app.dart``` to start the automated Tests
3. Enjoy the show. 
4. Gathered data can be found inside the build-Folder 
