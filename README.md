
## Prerequisites
- [AutoHotkey](https://www.autohotkey.com/)
- [ImageMagick](https://imagemagick.org/)

## Creating the screenshot

### Capturing the images ingame
Fill the settings.json file with variables corresponding to your needs

|Variable|Description|
|----|----|
|`startPoint`|Coordinates for the first teleportation.|
|`endPoint`|Creates with startPoint a rectangle of area that should be captured|
|`sleepTime`|in milliseconds. Time to wait between each screenshot. Depends on your computer|
|`screenshotSize`|in Pixels. Size of individual screenshots|
|`zoomFactor`|Corresponds to the zoom factor attribute in the Factorio screenshot command|
|`blockSize`|`screenshotSize / 32 / zoomFactor`|
|`chatOpenChar`|Character on the keyboard to press to open the chat window ingame. For special characters see the [AutoHotkey documentation](https://www.autohotkey.com/docs/commands/Send.htm#keynames)|
  

Then run the `factorio.ahk`, load your savegame in Factorio and **press 0 on the Numpad** to initiale the 
screenshotting sequence. Depending on the area to be covered this could take a while.
### ImageMagick commands

Convert all Images to JPEGs to save space and time lateron
```shell
$ magick mogrify -format jpg *.png
```
  
Then we can let ImageMagick tile them together
```shell
$ magick montage -mode concatenate -border 0 -verbose -tile 18x5 *.jpg out.jpg
```
Replace the `18x5` with the correct tiling for your screenshot.