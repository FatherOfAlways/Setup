## Installation

```
brew install ffmpeg
```



## Audiobooks (.m4b)

- .m4b is apparently just a renamed .m4a
- .m4b/.m4a are just wrappers for .aac (can just rename, no need for conversion)

CLI script for converting everything inside a particular folder to .mp3 (you first have to navigate to that folder in CLI):

```
cd PATH/TO/FOLDER
```

```
for i in *.m4b;
  do name=`echo "${i%.*}"`;
  echo "$name"
  ffmpeg -i "$i" "${name}.mp3"
done
```