import { spawn } from "child_process";
import fs from "fs";
import path from "path";

function findDesktopFiles() {
  const DIR = "/usr/share/applications/";

  const desktopFiles = [];

  if (fs.existsSync(DIR)) {
    const files = fs.readdirSync(DIR).filter((f) => f.endsWith(".desktop"));
    files.forEach((f) => desktopFiles.push(path.join(DIR, f)));
  }

  return desktopFiles;
}

function parseDesktopFile(file) {
  const content = fs.readFileSync(file, "utf-8");
  const lines = content.split("\n");

  let inDesktopEntry = false;
  let name = "";
  let exec = "";

  for (const line of lines) {
    if (line == "[Desktop Entry]") {
      inDesktopEntry = true;
    } else if (inDesktopEntry && line.startsWith("[")) {
      inDesktopEntry = false;
    }

    if (inDesktopEntry) {
      if (line.startsWith("Name=")) {
        name = line.substring(line.indexOf("=") + 1).trim();
      } else if (line.startsWith("Exec=")) {
        exec = line
          .substring(line.indexOf("=") + 1)
          .replace(/%[UufF]/, "")
          .trim();
      }
    }
  }

  return { name, exec };
}

function launch() {
  const desktopFiles = findDesktopFiles();
  const apps = [];
  const ignore = [
    "wheelmap.org",
    "Google Maps",
    "OpenStreetMap",
    "Qwant Maps",
    "Xwayland",
    "gammastep",
    "Pinentry",
    "fish"
  ];
  const terminalApps = ["yazi", "nvim", "vim", "btop"];

  for (const file of desktopFiles) {
    const result = parseDesktopFile(file);
    if (result.name && result.exec && !ignore.includes(result.name)) {
      apps.push(result);
    }
  }

  const fzf = spawn("fzf", ["--prompt=Launch: "]);
  fzf.stdin.write(apps.map((v) => `${v.name}|${v.exec}`).join("\n"));
  fzf.stdin.end();

  fzf.stdout.on("data", (data) => {
    const choice = data.toString().trim().split("|")[1];
    if (choice) {
      console.log(`Launching: ${choice}`);

      if (terminalApps.includes(choice)) {
        spawn(choice, { shell: true, stdio: "inherit" });
      } else {
        spawn(choice, { shell: true, detached: true, stdio: "ignore" }).unref();
      }
    }
  });
}

launch();
