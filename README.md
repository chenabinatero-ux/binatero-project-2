# Kabankalan Catholic College, Inc. - Landing Page

A modern, responsive landing page for **Kabankalan Catholic College, Inc.**, built with HTML5, CSS3, and Bootstrap 5.

**Project Owner:** Chena C. Binatero (BSIT Student Project)

## Description

This landing page introduces the college, showcases academic programs, provides admissions information, and presents campus life. It is designed as a polished, professional institutional website suitable for a student web development portfolio.

## Features

- Responsive Bootstrap 5 navbar with mobile collapse menu and active-link scrollspy
- Full-screen hero section with campus imagery and call-to-action buttons
- About section with Mission, Vision, and Core Values cards
- Academic programs grid (Basic Education, Senior High School, College programs)
- Admissions section with step-by-step enrollment guide and requirements list
- Campus life gallery showcasing student activities and organizations
- "Why Choose KCC" highlights section
- News & announcements cards (sample content)
- Contact section with info cards, Google Maps embed, and a front-end demo form
- Professional footer with quick links, academic links, and contact info
- Custom gold/navy design system with hover effects and smooth scrolling
- Back-to-top button and mobile-friendly layout

## Technologies Used

- HTML5
- CSS3 (custom properties, flexbox, media queries)
- Bootstrap 5.3 (CDN)
- Bootstrap Icons (CDN)
- Google Fonts (Playfair Display + Poppins)
- Vanilla JavaScript
- Git & GitHub
- GitHub Pages (deployment target)

## Folder Structure

```
binatero-project-2/
├── index.html              # Main landing page
├── README.md               # This file
├── css/
│   └── style.css           # Custom styles & design system
├── js/
│   └── script.js           # Interactive behaviors
├── assets/
│   ├── images/             # Placeholder images (replace with official photos)
│   │   ├── school-logo.png
│   │   ├── campus.jpg
│   │   ├── students.jpg
│   │   ├── academics.jpg
│   │   ├── admissions.jpg
│   │   ├── campus-life.jpg
│   │   └── news-*.jpg
│   ├── icons/
│   └── generate-images.ps1 # Script used to generate placeholder images
└── .gitignore
```

## Running Locally

No build step is required. You can open the site directly or serve it locally:

```bash
# Option 1: open index.html directly in a browser

# Option 2: serve with any static server, e.g. PHP (XAMPP)
cd binatero-project-2
php -S localhost:8000
# then visit http://localhost:8000
```

Since XAMPP is installed, the project also works at:
`http://localhost/Binatero-project-2/`

## GitHub Pages Deployment

1. Create a new repository named `binatero-project-2` on GitHub.
2. Push this project to the repository:

   ```bash
   git remote add origin https://github.com/<your-username>/binatero-project-2.git
   git branch -M main
   git push -u origin main
   ```

3. On GitHub, open the repository **Settings** tab.
4. In the left sidebar, click **Pages**.
5. Under **Build and deployment**, set **Source** to **Deploy from a branch**.
6. Select branch **main** and folder **/ (root)**.
7. Click **Save**.
8. Wait a minute for the deployment to finish - GitHub will show the live URL.
9. Test the published site and confirm all images, styles, and scripts load.

> All asset paths are relative (`css/`, `js/`, `assets/`), so the site works on GitHub Pages without changes.

## Important Notes Before Publishing

- **Images are placeholders.** Replace the generated images in `assets/images/` with official school photos and logo.
- **Sample content:** Mission, Vision, Core Values, academic programs, admission requirements, news items, and contact details are editable sample content marked with "Verify before publishing" badges. Confirm all official information before going live.
- **Contact form is a demo.** GitHub Pages is static-only; connect a form service (e.g., Formspree) or backend to enable real submissions.
- **Google Maps embed** currently shows Kabankalan City; update it with the official school address.

## Author

Chena C. Binatero - BSIT Student
