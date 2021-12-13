var markdownFile = WScript.Arguments.Item(0);
var templateFile = WScript.Arguments.Item(1);
var outputFile = WScript.Arguments.Item(2);

WScript.Echo("Copying " + templateFile + " into " + outputFile + " for markdown file " + markdownFile);

var ForReading = 1, ForWriting = 2;
var fso = new ActiveXObject("Scripting.FileSystemObject");

var file;
file = fso.OpenTextFile(markdownFile, ForReading);
var markdownText = file.ReadAll();
file.Close();

file = fso.OpenTextFile(templateFile, ForReading);
var templateText = file.ReadAll();
file.Close();

markdownText = markdownText.replace("\r\n", "\n");

var titleRE = /\n?# (.+)\n/;
var firstTitle = titleRE.exec(markdownText);
var title;
if (firstTitle) {
    title = firstTitle[1];
    WScript.Echo("Using title '" + title + "'");
} else {
    WScript.Echo("Unable to find top-level header to use as title, defaulting to 'Presentation'");
    title = "Presentation";
}

templateText = templateText.replace("<title>reveal.js</title>", "<title>" + title + "</title>");
templateText = templateText.replace("talk.md", fso.GetFileName(markdownFile));

file = fso.OpenTextFile(outputFile, ForWriting);
file.Write(templateText);
file.Close();

WScript.Quit(0);
