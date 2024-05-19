var puppeteer = require("puppeteer-core");

main();

async function main() {
  const BASE_URL = "https://metruyencv.com/truyen/de-ba/chuong-";
  const FROM = 1;
  const TO = 2;

  let { browser, page } = await openNewTab(BASE_URL, FROM, TO);
  let chapters = await getAllChapters(page, BASE_URL, FROM, TO);
  chapters.forEach(printChapter);

  await browser.close();
}

async function openNewTab() {
  let options = { executablePath: "/usr/bin/chromium", slowMo: 25, args: ["--no-sandbox"] };
  let browser = await puppeteer.launch(options);
  let page = await browser.newPage();

  return { browser, page };
}

async function getAllChapters(page, url, from, to) {
  let chapters = [];

  for (let i = from; i <= to; i++) {
    let chapter = await getChapter(page, `${url}${i}`);
    chapters.push(chapter);
  }

  return chapters;
}

async function getChapter(page, url) {
  await page.goto(url);
  await page.waitForSelector("#chapter-detail");
  let title = await page.evaluate(() => document.querySelector("h2").innerText);
  let content = await page.evaluate(() => document.querySelector("#chapter-detail").innerText);

  return { title, content };
}

function printChapter({ title, content }) {
  console.log(title);
  console.log(title.replace(/./g, "-"));
  console.log();
  console.log(content);
  console.log("\n");
}
