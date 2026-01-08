import puppeteer from 'puppeteer';
import { PDFDocument } from 'pdf-lib';
import fs from 'fs/promises';
import path from 'path';

const BASE_URL = 'http://localhost:8080';
const OUTPUT_DIR = './pdf_output';
const FINAL_PDF = './slides.pdf';

// Slide routes in order (from main.dart)
const SLIDE_ROUTES = [
  '/title-main',
  '/toc',
  '/self-introduction',
  '/flutter-multiplatform',
  '/what-is-flutter',
  '/flutter-history',
  '/ui-equals-f-state',
  '/ui-equals-f-state-explanation',
  '/flutter-demo',
  '/riverpod-hooks-intro',
  '/riverpod-hooks-demo',
  '/flutter-web-section',
  '/flutter-web-intro',
  '/flutter-web-rendering',
  '/flutter-web-rendering-conclusion',
  '/flutter-web-seo',
  '/flutter-web-pwa',
  '/flutter-web-pwa-service-worker',
  '/flutter-web-ready',
  '/webcomponents-section',
  '/why-webcomponents',
  '/webcomponents-embed',
  '/webcomponents-register',
  '/webcomponents-display',
  '/webcomponents-communication',
  '/webcomponents-reference',
  '/wasm-section',
  '/wasm-rendering',
  '/wasm-build',
  '/wasm-build-files-flow',
  '/wasm-webcomponents-warning',
  '/summary',
  '/made-with-flutter',
];

async function main() {
  // Create output directory
  await fs.mkdir(OUTPUT_DIR, { recursive: true });

  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });

  const page = await browser.newPage();
  await page.setViewport({ width: 1920, height: 1080 });

  const screenshots = [];

  for (let i = 0; i < SLIDE_ROUTES.length; i++) {
    const route = SLIDE_ROUTES[i];
    const url = `${BASE_URL}/#${route}`;
    console.log(`Capturing slide ${i + 1}/${SLIDE_ROUTES.length}: ${url}`);

    await page.goto(url, { waitUntil: 'networkidle0', timeout: 30000 });
    await new Promise(r => setTimeout(r, 1500)); // Wait for animations

    const screenshotPath = path.join(OUTPUT_DIR, `slide_${String(i).padStart(2, '0')}.png`);
    await page.screenshot({ path: screenshotPath, fullPage: false });
    screenshots.push(screenshotPath);
  }

  await browser.close();

  // Combine screenshots into PDF
  console.log('Creating PDF...');
  const pdfDoc = await PDFDocument.create();

  for (const screenshotPath of screenshots) {
    const imageBytes = await fs.readFile(screenshotPath);
    const image = await pdfDoc.embedPng(imageBytes);

    const page = pdfDoc.addPage([1920, 1080]);
    page.drawImage(image, {
      x: 0,
      y: 0,
      width: 1920,
      height: 1080,
    });
  }

  const pdfBytes = await pdfDoc.save();
  await fs.writeFile(FINAL_PDF, pdfBytes);

  console.log(`PDF saved to ${FINAL_PDF}`);

  // Cleanup screenshots
  await fs.rm(OUTPUT_DIR, { recursive: true });
  console.log('Done!');
}

main().catch(console.error);
