// ============================================================
// Kabankalan Catholic College, Inc. - Custom Scripts
// Author: Chena C. Binatero (BSIT Student Project)
// ============================================================

(function () {
    'use strict';

    // ---------- Navbar scroll effect ----------
    const navbar = document.querySelector('.kcc-navbar');

    function onScroll() {
        if (window.scrollY > 40) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    }

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    // ---------- Collapse mobile menu after clicking a link ----------
    const navLinks = document.querySelectorAll('#kccNavbar .nav-link, #kccNavbar .nav-cta');
    const collapseEl = document.getElementById('kccNavbar');

    navLinks.forEach(function (link) {
        link.addEventListener('click', function () {
            if (collapseEl.classList.contains('show')) {
                const bsCollapse = bootstrap.Collapse.getInstance(collapseEl);
                if (bsCollapse) {
                    bsCollapse.hide();
                }
            }
        });
    });

    // ---------- Active nav link highlighting (scrollspy) ----------
    const sections = document.querySelectorAll('main section[id]');
    const navItems = document.querySelectorAll('#kccNavbar .nav-link');

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                const id = entry.target.getAttribute('id');
                navItems.forEach(function (item) {
                    item.classList.toggle('active', item.getAttribute('href') === '#' + id);
                });
            }
        });
    }, { rootMargin: '-40% 0px -55% 0px' });

    sections.forEach(function (section) {
        observer.observe(section);
    });

    // ---------- Back to top button ----------
    const backToTop = document.getElementById('backToTop');

    function toggleBackToTop() {
        if (window.scrollY > 500) {
            backToTop.classList.add('show');
        } else {
            backToTop.classList.remove('show');
        }
    }

    window.addEventListener('scroll', toggleBackToTop, { passive: true });
    toggleBackToTop();

    backToTop.addEventListener('click', function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    // ---------- Contact form (front-end demo) ----------
    const contactForm = document.getElementById('contactForm');

    contactForm.addEventListener('submit', function (event) {
        event.preventDefault();

        if (!contactForm.checkValidity()) {
            contactForm.reportValidity();
            return;
        }

        // Demo only: no backend is connected on GitHub Pages.
        // Replace this with a real form service (e.g., Formspree) when deploying.
        alert('Thank you! This is a demo form - your message was not sent. ' +
              'Connect a form service (e.g., Formspree) to enable real submissions.');
        contactForm.reset();
    });
})();
