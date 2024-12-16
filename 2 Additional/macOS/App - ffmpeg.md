## Installation

```
brew install ffmpeg
```



## Audiobooks (.m4b)

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