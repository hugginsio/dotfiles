# vim: ft=python

from dataclasses import dataclass
from datetime import datetime
from zoneinfo import ZoneInfo
import json
import subprocess


@dataclass
class WorkItem:
    application: str
    identifier: int
    installDate: str
    state: str
    title: str


def azGetWorkItem(identifier: str | int) -> WorkItem:
    azOutput = subprocess.run(
        [
            "az",
            "boards",
            "work-item",
            "show",
            "--id",
            str(identifier),
            "--org",
            "https://dev.azure.com/jbhunt/",
            "--output",
            "json",
        ],
        stdout=subprocess.PIPE,
        check=True,
    )

    azJson = json.loads(azOutput.stdout.decode("utf-8"))
    fields = azJson["fields"]

    installDate = fields.get("JBH.InstallDate", "")
    if installDate:
        installDate = azConvertInstallDate(installDate)

    return WorkItem(
        application=fields.get("Custom.Repository", ""),
        identifier=azJson["id"],
        installDate=installDate,
        state=str(fields["System.BoardColumn"]).lower().replace(" ", "-"),
        title=fields["System.Title"],
    )


def azConvertInstallDate(installDateZulu: str) -> str:
    date = datetime.strptime(installDateZulu, "%Y-%m-%dT%H:%M:%SZ").replace(
        tzinfo=ZoneInfo("UTC")
    )

    return date.astimezone(datetime.now().astimezone().tzinfo).strftime("%Y-%m-%d")


def zkNewNote(notebookPath: str, title: str, extra: str = ""):
    subprocess.run(
        [
            "zk",
            "new",
            "--no-input",
            notebookPath,
            "--id",
            "wi",
            "--title",
            title,
            "--extra",
            extra,
        ]
    )


def zkEditFile(workItemFile: str):
    subprocess.run(["zk", "edit", workItemFile])
