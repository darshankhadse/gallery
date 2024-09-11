# getx_architecture

A new Flutter project.
# Image Gallery App

## Overview

The Image Gallery App is a Flutter application that displays a gallery of images retrieved from the Pixabay API. It features a grid layout that adjusts based on screen width, allows users to search for images, and provides a full-screen view with zooming capability. The app supports both Android and iOS platforms and also provides a web version.

## Features

- **Responsive Grid Layout:** Images are displayed in a square grid with a number of columns that adjusts based on screen width.
- **Image Fetching:** Images are fetched from the Pixabay API with support for pagination.
- **Search Functionality:** A search field allows users to filter images based on keywords. Search results update with debounce to avoid excessive API calls.
- **Category Suggestions:** Search suggestions for popular image categories are provided in the search box.
- **Infinite Scrolling:** New images are automatically loaded as the user scrolls down.
- **Full-Screen View:** Clicking on an image opens it in full-screen mode with a zooming feature, and the user can return to the gallery.

### Notes:

**API Key:** Ensure that the `apiKey` placeholder in the `home_controller.dart` file is correctly replaced with a valid Pixabay API key.
