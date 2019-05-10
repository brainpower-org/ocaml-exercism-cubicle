#!/usr/bin/env node
const Fs = require('fs');

function main() {
    const exercises = Fs.readdirSync('./exercises');

    const configurations = exercises.map(e => ({
        "name": e,
        "type": "ocaml-debugger",
        "request": "launch",
        "program": ["${workspaceRoot}/_build/default/exercises/", e, "/test.bc"].join(""),
        "console": "internalConsole",
        "dotMerlins": [
            ["${workspaceRoot}/exercises/", e, "/.merlin"].join("")
        ],
        "noDebug": false,
        "stopOnEntry": false,
        "preLaunchTask": e
    }));

    const tasks = exercises.map(e => ({
        "label": e,
        "type": "shell",
        "command": "dune",
        "args": [
            "build",
            "test.bc",
            "--profile=release"
        ],
        "group": "build",
        "presentation": {
            "reveal": "silent"
        },
        "options": {
            "cwd": `exercises/${e}`
        }
    }));

    write('.vscode/launch.json', { configurations });
    write('.vscode/tasks.json', { tasks });
}

function read(p) {
    try {
        return JSON.parse(Fs.readFileSync(p, 'utf-8'));;
    } catch (e) {
        return { version: "2.0.0" };
    }
}

function write(p, data) {
    Fs.writeFileSync(p, JSON.stringify({...read(p), ...data}, null, '  '));
}


main();