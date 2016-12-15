---
title: "An interactive timeline to organize events"
output: html_document
---

![](https://raw.github.com/agrou/rladiesLisboa/master/Timeline.png)


This in an example of a timeline to organize R-Ladies events.

This timeline was base on Dean Attali's example of an interactive Timeline: https://github.com/daattali/timevis

To reproduce the timeline you should copy (clone or download) the documents on the folder 'TimelineDocs' into a local directory, open the documents in R Studio and run the App. 

The folder 'TimelineDocs' contains:
- a css document ('rladiestimeline.css) that you should save into a folder named 'www', saved in the same directory or project
- a text document ('RLadiesEvents1') where all the new events are going to be added. You need this file to have a starting date a generate a database with all the additions to the timeline.
- a 'ui.R' document that defines the user interface part of the app
- a 'server' document that defines the server part of the app

After opening all this files into R studio you can click on 'RunApp' button and open the timeline. If you want to create your own timeline we recommend ignoring the document 'RLadiesEvents1' and creating a new equivalent text document where your changes will be saved. This includes changing the name of the document into a new one on the server code.

If you have any questions or suggestions please contact us on lisboa@rladies.org

