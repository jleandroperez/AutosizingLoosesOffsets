AutosizingLoosesOffsets
=======================

In this sample project, we demonstrate a bug in the Autosizing Cells mechanism.

#### Background:

In a tableView with automatically calculated cell heights, content offset is being lost after going to another viewController, and heading back.

#### Steps:

1. Launch the sample app.
2. Scroll down.
3. Tap over any cell.
4. Hit back.

As a result the UITableView's scroll offset will be lost.
