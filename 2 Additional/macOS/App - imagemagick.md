## Installation

```
brew install imagemagick
```



## Usage

**Converts WEBPs to PNGs**

```
cd "/PATH/TO/FOLDER"
mogrify -format png *.webp
mkdir _old
mv *.webp _old
```

- *Alternative:*

	```
	cd "/PATH/TO/FOLDER"
	mogrify -format png *.webp && mkdir _old && mv *.webp _old
	```


**Converts WEBPs to GIFs**

```
cd "/PATH/TO/FOLDER"
mogrify -format gif *.webp && mkdir _old && mv *.webp _old
```


## Resources

- [Homepage](https://imagemagick.org/script/download.php)
- [Repo](https://github.com/ImageMagick/ImageMagick)
- [Conversion - Docs](https://imagemagick.org/script/mogrify.php)
- [Conversion - StackOverflow](https://stackoverflow.com/questions/15315770/how-to-convert-all-files-in-different-formats-in-given-folder-to-different-fil)