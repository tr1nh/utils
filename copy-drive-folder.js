/**
 * Script to clone a folder in Google Drive
 * 
 * How to use this script?
 * - Create a new Google Apps Script in Google Drive
 * - Paste this code
 * - Save and run 
 */

var cwd = null;

function surf(folderId = "your-folder-id") {
  let folder = DriveApp.getFolderById(folderId);
  let files = folder.getFiles();
  let folders = folder.getFolders();
  
  let newFolder = copyFolder(folderId);
  let tempCwd = cwd;
  cwd = newFolder;

  while (files.hasNext()) {
    let file = files.next();
    let name = file.getName();
    let id = file.getId();

    console.log("- File", name, id);
    copyFile(id, cwd);
  }

  while (folders.hasNext()) {
    folder = folders.next();
    let name = folder.getName();
    let id = folder.getId();

    console.log("- Folder", name, id);
    surf(id);
  }

  if (tempCwd) cwd.moveTo(tempCwd);
}

function copyFolder(folderId) {
  let folder = DriveApp.getFolderById(folderId);
  let name = folder.getName();
  let newFolder = DriveApp.createFolder(name);

  return newFolder;
}

function copyFile(fileId, dest) {
  let file = DriveApp.getFileById(fileId);
  let newFile = file.makeCopy(dest);
  return newFile;
}