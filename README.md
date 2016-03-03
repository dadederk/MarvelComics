# MarvelComics
This is an example project written in Swift to use the Marvel Comic's API.

## Getting started
In order for the App to be able to get data from the Marvel API, you will need to register to Marvel's developer portal, tapping the `Get Started` button here: http://developer.marvel.com

Once you are registered, go to the `Get a key` or `My Developer Account` section of the web portal. You will see a `public key` and a `private key`.

Go to the file `MarvelAPIConfig.plist` inside the project, under the path: `/MarvelComics/MarvelComics/ConfigFiles/`. There you can introduce your `public key` as the value of the `ApiKey` key, and the `private key` as the value of the `PrivateKey` key.

**Example:** 

If your 'api key' is '1234' and your 'private key' is 'abcd', the file should look like this:
```
<plist version="1.0">
<dict>
	<key>ApiKey</key>
	<string>1234</string>
	<key>PrivateKey</key>
	<string>abcd</string>
</dict>
</plist>
```
