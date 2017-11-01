# electron-catalyst

Package for electron app publishing which drastically decreases bundle size by caching the prerequisites for apps to work

By using `electron-catalyst` like in the following example on a https://github.com/atom/electron-quick-start example app 

![](https://user-images.githubusercontent.com/42368/32255161-4bce2a38-be63-11e7-9263-ca0f2c3bac45.png)

will generate following ![](https://user-images.githubusercontent.com/42368/32255189-6ded445a-be63-11e7-8b89-b0006a59bb5c.png) the `TestApp.app` is the app bundled with `Electron` but the other one `TestApp-catalyst` is bundled with https://github.com/cenkalti/catalyst which dramatically reduces the file size. Once catalysed version is launched by the end-user catalyst will get the files required in generated config above, if it's already downloaded it will re-use that which is the main trick with the catalyst.

And if one of the catalyst bundled app is executed on the user machine before rest will re-use the existing `Electron` version.

This uses `electron-packager` for generating the traditional package which means you can use any arguments that `electron-packager` supports as well.

Whole current implementation has been done in a day at Packathon http://packathon.org/ (Jan 23 '16)

TODO
----

 - Add linux, win platform support
 - Code cleanup

AUTHORS
-------
 
 - Gokmen Goksel (@gokmen)
 - Cenk Altı (@cenkalti)
