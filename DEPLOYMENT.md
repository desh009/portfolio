# Deployment Guide

This guide covers various deployment options for your Flutter Web Portfolio.

## Pre-Deployment Checklist

- [ ] Update personal information in `lib/data/portfolio_data.dart`
- [ ] Add your actual projects and experience
- [ ] Update social media links (GitHub, LinkedIn, Twitter)
- [ ] Replace placeholder images with actual photos/screenshots
- [ ] Test responsiveness on different screen sizes
- [ ] Verify all links work correctly
- [ ] Check contact form behavior
- [ ] Run `flutter analyze` to ensure no errors
- [ ] Test the production build locally

## Building for Production

```bash
# Get dependencies
flutter pub get

# Build for web (production)
flutter build web --release

# The output will be in build/web directory
```

## Deployment Options

### 1. GitHub Pages (Free)

**Steps:**

1. Build your project:
   ```bash
   flutter build web --release
   ```

2. Create a new repository on GitHub (e.g., `username.github.io`)

3. Copy contents of `build/web` to your repository:
   ```bash
   cd build/web
   git init
   git add .
   git commit -m "Initial portfolio deployment"
   git branch -M main
   git remote add origin https://github.com/username/username.github.io.git
   git push -u origin main
   ```

4. Enable GitHub Pages:
   - Go to repository Settings
   - Navigate to Pages
   - Select branch: `main`, folder: `/ (root)`
   - Save

5. Your site will be live at `https://username.github.io`

**Updating:**
```bash
flutter build web --release
cd build/web
git add .
git commit -m "Update portfolio"
git push
```

### 2. Firebase Hosting (Free)

**Steps:**

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase in your project:
   ```bash
   firebase init hosting
   ```
   - Choose your Firebase project
   - Set public directory to: `build/web`
   - Configure as single-page app: Yes
   - Don't overwrite index.html

4. Build and deploy:
   ```bash
   flutter build web --release
   firebase deploy
   ```

5. Your site will be live at `https://your-project.web.app`

**Updating:**
```bash
flutter build web --release
firebase deploy
```

### 3. Netlify (Free)

**Option A: Drag and Drop**

1. Build your project:
   ```bash
   flutter build web --release
   ```

2. Go to [Netlify](https://netlify.com)
3. Drag the `build/web` folder to Netlify's deployment zone
4. Your site will be live instantly

**Option B: Continuous Deployment**

1. Push your code to GitHub

2. Connect Netlify to your GitHub repository

3. Configure build settings:
   - Build command: `flutter build web --release`
   - Publish directory: `build/web`

4. Deploy automatically on every push

### 4. Vercel (Free)

**Steps:**

1. Push your code to GitHub

2. Go to [Vercel](https://vercel.com)

3. Import your repository

4. Configure:
   - Build Command: `flutter build web --release`
   - Output Directory: `build/web`

5. Deploy

### 5. Custom Domain Setup

**For GitHub Pages:**

1. Add a `CNAME` file to `build/web` with your domain:
   ```
   yourdomain.com
   ```

2. Configure DNS records:
   ```
   Type: A
   Name: @
   Value: 185.199.108.153
   Value: 185.199.109.153
   Value: 185.199.110.153
   Value: 185.199.111.153
   
   Type: CNAME
   Name: www
   Value: username.github.io
   ```

**For Firebase/Netlify/Vercel:**

Follow their respective custom domain setup guides in the dashboard.

## Performance Optimization

### Enable Caching

Add this to `web/index.html` in the `<head>` section:

```html
<meta http-equiv="Cache-Control" content="max-age=31536000">
```

### Optimize Images

1. Compress images before adding to `assets/images/`
2. Use WebP format when possible
3. Provide different sizes for responsive images

### Enable PWA (Progressive Web App)

The project includes a basic PWA setup. To enhance:

1. Update `web/manifest.json` with your app details
2. Update icons in `web/icons/`
3. Customize service worker in `web/flutter_service_worker.js`

## SEO Optimization

### Update Meta Tags

Edit `web/index.html`:

```html
<head>
  <!-- Basic Meta Tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- SEO Meta Tags -->
  <title>Desh Bala - Flutter Developer Portfolio</title>
  <meta name="description" content="Professional Flutter Developer with 2+ years of experience. Specialized in mobile app development, Firebase, and state management.">
  <meta name="keywords" content="Flutter Developer, Mobile App Development, Dart, Firebase, Portfolio">
  <meta name="author" content="Desh Bala">
  
  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://yourdomain.com/">
  <meta property="og:title" content="Desh Bala - Flutter Developer">
  <meta property="og:description" content="Professional Flutter Developer Portfolio">
  <meta property="og:image" content="https://yourdomain.com/preview.png">
  
  <!-- Twitter -->
  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:url" content="https://yourdomain.com/">
  <meta property="twitter:title" content="Desh Bala - Flutter Developer">
  <meta property="twitter:description" content="Professional Flutter Developer Portfolio">
  <meta property="twitter:image" content="https://yourdomain.com/preview.png">
</head>
```

### Add robots.txt

Create `web/robots.txt`:

```
User-agent: *
Allow: /
Sitemap: https://yourdomain.com/sitemap.xml
```

### Create sitemap.xml

Create `web/sitemap.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://yourdomain.com/</loc>
    <lastmod>2026-09-09</lastmod>
    <priority>1.0</priority>
  </url>
</urlset>
```

## Analytics

### Google Analytics

Add to `web/index.html` before `</head>`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## Testing Production Build Locally

```bash
# Build
flutter build web --release

# Serve locally
cd build/web
python -m http.server 8000
# or
npx serve .

# Visit http://localhost:8000
```

## Troubleshooting

### Build Errors

1. Clear build cache:
   ```bash
   flutter clean
   flutter pub get
   flutter build web --release
   ```

### Deployment Issues

1. Ensure `build/web/index.html` exists
2. Check all paths are relative
3. Verify file permissions
4. Clear browser cache

### Performance Issues

1. Enable web renderer optimization:
   ```bash
   flutter build web --release --web-renderer canvaskit
   ```

2. Or use HTML renderer for better loading:
   ```bash
   flutter build web --release --web-renderer html
   ```

## Monitoring

- **Google Search Console** - Monitor search visibility
- **Google Analytics** - Track visitor behavior
- **Lighthouse** - Test performance and SEO

## Security

1. Never commit sensitive data
2. Use environment variables for API keys
3. Enable HTTPS (most hosts provide this by default)
4. Regularly update dependencies

## Support

For issues specific to this portfolio:
- Check the README.md
- Review the code comments
- Verify your Flutter version matches requirements

---

**Last Updated:** September 9, 2026
