# 📸 How to Add Your Profile Image

## Step 1: Save Your Image

1. আপনার profile photo টি save করুন এই folder এ:
   ```
   assets/images/profile.jpg
   ```

2. অথবা আপনার পছন্দের নামে save করুন (যেমন: `my_photo.png`)

## Step 2: Update Portfolio Data

যদি আপনি ভিন্ন নাম/format use করেন, তাহলে `lib/data/portfolio_data.dart` file এ update করুন:

```dart
// Profile Image (base64 or asset path)
static const String? profileImagePath = 'assets/images/your_image_name.jpg';
```

## Supported Image Formats

✅ JPG/JPEG
✅ PNG
✅ WebP

## Recommended Image Specs

- **Size**: 500x500px or larger (square recommended)
- **Format**: JPG or PNG
- **File Size**: Under 500KB for better performance
- **Background**: Clean background works best
- **Quality**: High quality, well-lit photo

## Image Optimization Tips

### 1. Resize Image (Online Tools)
- [TinyPNG](https://tinypng.com/) - Compress images
- [Squoosh](https://squoosh.app/) - Google's image optimizer
- [CompressJPEG](https://compressjpeg.com/) - Simple compression

### 2. Recommended Settings
- Width: 500px
- Height: 500px
- Quality: 80-90%
- Format: JPG (smaller file size)

## Current Setup

Your profile image will appear in:
1. ✨ **Hero Section** - Large animated circle (top of page)
2. 👤 **About Section** - Professional profile view

## Example: Adding Your Image

### Windows
1. Right-click আপনার image file
2. Copy করুন
3. Navigate করুন: `c:\flutteryyy\portfiliodf\assets\images\`
4. Paste করুন
5. Rename করুন `profile.jpg` তে

### Command Line
```bash
# Copy your image to the assets folder
copy "C:\path\to\your\photo.jpg" "assets\images\profile.jpg"
```

## Testing

After adding your image:

```bash
# Run the app
flutter run -d chrome

# If image doesn't show, try:
flutter clean
flutter pub get
flutter run -d chrome
```

## Troubleshooting

### Image Not Showing?

1. **Check file path**: Ensure image is at `assets/images/profile.jpg`
2. **Check pubspec.yaml**: Should have `assets/images/` configured
3. **Check file extension**: JPG not JPEG? Update in portfolio_data.dart
4. **Run flutter clean**: Then `flutter pub get` and run again

### Image Shows But Looks Bad?

1. Use a square image (1:1 aspect ratio)
2. Higher resolution (minimum 500x500px)
3. Compress with TinyPNG
4. Use good lighting in your photo

## Advanced: Multiple Images

Want to use different images in different sections?

### Add Multiple Images
```
assets/images/
├── profile.jpg          (Main profile)
├── profile_hero.jpg     (For hero section)
├── profile_about.jpg    (For about section)
```

### Update Code
In `lib/data/portfolio_data.dart`:
```dart
static const String? profileImagePath = 'assets/images/profile.jpg';
static const String? heroImagePath = 'assets/images/profile_hero.jpg';
static const String? aboutImagePath = 'assets/images/profile_about.jpg';
```

## Need Help?

1. Check if `pubspec.yaml` has:
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

2. File permissions: Make sure the image file is readable

3. File format: Stick to JPG or PNG

---

**Quick Start**: Just save your photo as `profile.jpg` in this folder and run the app! 📸
