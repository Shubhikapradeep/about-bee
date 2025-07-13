#!/bin/bash
npm run build
cd dist
git init
git add .
git commit -m "Deploy to GitHub Pages"
git remote add origin https://github.com/Shubhikapradeep/about-bee.git
git push -f origin main:gh-pages
cd ..
rm -rf dist/.git

echo "Deployment complete! Your site will be available at https://shubhikapradeep.github.io/about-bee/"