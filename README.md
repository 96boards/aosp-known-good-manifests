# known-good-manifests
Snapshots of "known-good" AOSP manifests for various devboards

Where "known-good" means that basic functionality has been checked and it should be ok for development work.

To use:

1) Go to your already checked out AOSP TOP_DIR

2) Download the known-good manifest you wish to use.

3) Initialize & sync the repo using the manifest:

    `repo sync -j24 -m <MANIFEST>.xml`
    
4) Then proceed to build.


To switch back to AOSP/master:

1) Go to your already checked out AOSP TOP_DIR

2) Re-Initialize and sync the repo using the AOSP/master manifest:

    `repo sync -j24`

