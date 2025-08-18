## Common Commands

### Video

- Specify custom location:

	```
	yt-dlp -o '/path/to/file//%(title)s.%(ext)s' 'https://LINK_TO_VIDEO'
	```

- Specify video quality:

	```
	yt-dlp -f 'bestvideo[height=720]+bestaudio/best' 'https://LINK_TO_VIDEO'
	```



### Audio

- Extract Raw Audio from .m4a

	```
	yt-dlp --ignore-config -o '~/Downloads/ yt-dlp/%(title)s.%(ext)s' -x --audio-format "m4a" 'https://LINK_TO_VIDEO'
	```

- Extract Raw Audio from Video & Convert to .mp3

	```
	yt-dlp --ignore-config -o '~/Downloads/ yt-dlp/%(title)s.%(ext)s' -f 'bestaudio' -x --audio-format "mp3" 'https://LINK_TO_AUDIO_OR_VIDEO'
	```

- Download Video w/ Best Audio

	```
	yt-dlp --ignore-config -o '~/Downloads/ yt-dlp/%(title)s.%(ext)s' -f 'bestaudio' -k 'https://LINK_TO_AUDIO_OR_VIDEO'
	```



## Resources

- [Documentation](https://github.com/yt-dlp/yt-dlp)
- [yt-dlp for dummies](https://www.reddit.com/r/youtubedl/comments/15xqg3t/ytdlp_for_dummies/)