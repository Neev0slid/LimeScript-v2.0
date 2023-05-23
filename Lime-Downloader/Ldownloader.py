#!/bin/env pyhton3
from pytube import YouTube

print("................Welcome To Lime Downloader...............")
print("......................By @Neev0slid......................")
print (" ")

# YouTube video URL
url = input("Enter the YouTube video URL: ")
video = YouTube(url)

# Print video details
print("Title:", video.title)
print("Duration:", video.length, "seconds")

# Get the highest resolution stream
stream = video.streams.get_highest_resolution()

# Download the video
print("Downloading video...")
stream.download()
print("Video downloaded successfully!")
