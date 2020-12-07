# News Nest
An iOS application to view latest news of various topics from all around the world in multiple language

## Summary
* [Introduction & General Information](#introduction--general-information)
* [Application Design](#application-design)
* [Run Locally](#run-locally)

## Introduction & General Information
- This iOS application is designed with an aim to provide users with the latest news from around the world in various languages and of different topics.
- Currently, there isn't a good way to get news from various countries in their local languages in a single application.
- Hence, this application is for filling that gap.

## Application Design
- News Nes iOS application is based on multi controller design, with detailed news presented in UIWebView.
- This application is powered by [News API](https://newsapi.org/docs/endpoints/top-headlines) for fetching all the latest headlines.
- Some of the screenshots are shown below, which outline the design.

### Home Screen
![Home Screen](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/home-screen.png)

### Detail Screen
 - Detail screen opens the selected news link from the list in a UIWebView.
 - For example, here a news article in from China (in local language Mandrain), as well as an article from Australia (in local language English) can be seen in UIWebView.

![News in Mandrain](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/news-web-view-chinese.png)
![News in English](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/news-web-view-au.png)

### Select Country
- Selecting a country shows the news from that country in it's local language.
- For example, here the headlines from Germany (in local language German), as well as headlines from United Arab Emirates (in local language Arabic) can be seen.
- Currently, the supported countries are: USA, Australia, India, UK, UAE, Germany, China.

![Headlines in English](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/select-country.png)
![Headlines in German](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/news-germany.png)
![Headlines in Arabic](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/news-uae.png)

### Select Category
- News from all countries can be filtered based on specific categories.
- Currently, the supported categories are: General, Business, Health, Science, Sports, Technology.

![Select Category](https://github.com/setu-parekh/news-nest-ios-application/blob/main/Images/select-category.png)

## Run Locally
* Make sure XCode is installed. XCode can be installed from [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
* Go to Terminal and clone the project: `git clone https://github.com/setu-parekh/news-nest-ios-application.git`
* Route to the cloned project: `cd news-nest-ios-application`
* Open the project files in finder window: `open .`
* Double click on: `News Nest.xcworkspace` - which will open the whole project in XCode
* Build and run the project by pressing `CMD + R` on the keyboard
