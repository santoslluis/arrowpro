# ArrowPro - Flutter Web Application

## Overview
This is a Flutter web application called "ArrowPro" - an arrows game built with Flutter.

## Project Structure
- `lib/` - Dart source code
  - `main.dart` - Main application entry point
- `web/` - Web-specific assets (HTML, manifest, icons)
- `build/web/` - Compiled web application (generated)
- `serve.py` - Python HTTP server for serving the built app
- `pubspec.yaml` - Flutter/Dart package configuration

## Development

### Building the App
```bash
flutter build web --release --base-href "/"
```

### Running Locally
The app is served using a Python HTTP server on port 5000:
```bash
python serve.py
```

### Dependencies
- Flutter SDK (via Nix)
- Dart SDK (via Flutter)
- Python 3.11 (for serving)

## Architecture
- Standard Flutter web application using Material Design
- Built with release configuration for optimal performance
- Served via Python's built-in HTTP server with cache control headers

## Recent Changes
- January 30, 2026: Initial Replit environment setup
  - Installed Flutter via Nix packages
  - Fixed SDK version constraints for compatibility
  - Created Python server for web deployment
  - Built Flutter web app for production
