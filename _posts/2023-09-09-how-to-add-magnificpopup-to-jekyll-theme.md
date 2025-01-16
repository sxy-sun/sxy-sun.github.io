---
title: How to Add Magnific Popup Plugin to Jekyll Theme
date: 2023-09-09 21:00:00 -0400
categories: [Technotes, Jekyll]
math: true
media_subpath: /assets/figures/2023-images/2023-04-17-iot-weather-station-with-esp32
---

While I am building a documentation website for my work, I decided to use the free template [just-the-docs](https://just-the-docs.com/) as a quick solution. However, this theme doesn't have an image pop-up feature like [chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) does: when you click on the image, it would pop into a larger version, make it easier for readers to see the details of the sample images. For example, when you click the image below, it pops up.

![](fullview.png)

Therefore, in this article, I will show you what I did to simply include the [Magnific Popup](https://github.com/dimsemenov/Magnific-Popup) plugin in this project. Specifically, for the [just-the-docs](https://just-the-docs.com/) theme.

## Step 1: Install Magnific Popup
You can go to the [Magnific Popup's GitHub repository](https://github.com/dimsemenov/Magnific-Popup), follow the instruction there. 

Or, if you are using Gemfile, add this line `gem 'magnific-popup-rails', '~> 1.1'` to your Gemfile as denoted from [rubygem website](https://rubygems.org/gems/magnific-popup-rails). Then run `bundle install`, it installs all the necessary gems specified in your Gemfile.

## Step 2: Add the Magnific Popup files to your Jekyll site
You will need to add the Magnific Popup's main CSS (`magnific-popup.css`) and JS (`jquery.magnific-popup.js`) files to your Just-The-Docs repository. Both files are in the /`dist` folder in the [Magnific Popup's GitHub repository](https://github.com/dimsemenov/Magnific-Popup).

1. Create a new folder in your repository root directory named `/assets`.
2. Inside assets, create two more folders: `/css` and `/js`.
3. Upload `magnific-popup.css` into the `/assets/css` folder and `jquery.magnific-popup.min.js` into the `/assets/js` folder.

You might ask: why .min.js file not using the .js file? 

This reason is: [from ChatGPT 4.0]
- The .min.js files are minified versions of regular JavaScript .js files. 
- Minification is the process of removing all unnecessary characters from the source codes without changing their functionality. These unnecessary characters usually include white spaces, new line characters, comments, and sometimes block delimiters, which are used to add readability to the code but are not required for execution.

## Step 3: Override the theme's default layout
You will need to override Just-The-Docs' default layout to include references to the CSS and JS files. You can do this in the `_layouts` directory.

1. In your own repository, create a new folder at the root named `_layouts` if it's not there.
2. Inside `_layouts`, create a new file and name it `default.html`.
3. Go to Just-The-Docs theme repository on [GitHub](https://github.com/pmarsceill/just-the-docs).
4. Find the `_layouts` directory in the Just-The-Docs theme repository, then find the `default.html` file. 
5. Copy all the content of `default.html` from the github repo to your own `/_layouts/default.html`.

## Step 4: Include references to Magnific Popup in your template
Now that your `default.html` is created, you need to include CSS and JS files.

In `default.html`, insert this above the `<body>` section:

```html
<head>
    <link rel="stylesheet" href="{{ "/assets/css/magnific-popup.css" | relative_url }}">
</head>
```

Then, scroll to the end of the document and just before the `</body>` end tag, insert these two lines:

```html
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="{{ "/assets/js/jquery.magnific-popup.min.js" | relative_url }}"></script>
```

## Step 5: Initialize the plugin
You can either initialize the plugin in the `default.html` itself or create a new .js file
1. Create a new main.js file in the `/assets/js` directory.
2. In the `main.js` file, add the following JavaScript:
```javascript
$(document).ready(function() {
    $('.image-link').magnificPopup({type:'image'});
  });
```

3. Add this main.js file into your default.html, just after the previous script link:
```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="{{ "/assets/js/jquery.magnific-popup.min.js" | relative_url }}"></script>
<!-- Add it here -->
<script src="{{ "/assets/js/main.js" | relative_url }}"></script>
```

## Step 6: Test with your image
The markdown syntax that links an image with a specific class will not directly work in Jekyll. Instead, you'll have to use raw HTML in your Markdown file like below:
```markdown
<a class="image-link" href="pathToYourLargeImage">
  <img src="pathToYourThumbnailImage" alt="Image Description">
</a>
```

And that's it, enjoy the new feature!

---
Fun fact, this is the first post I have after my graduation. Turned out I do enjoy research on things related to my study and work :o