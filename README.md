# known-good-manifests
Snapshots of "known-good" AOSP manifests for various devboards

Where "known-good" means that basic functionality has been checked and it should be ok for development work.

To use:

1) Download the manifest file you'd like to use.

2) Go to your already checked out AOSP TOP_DIR

3) Initialize & sync the repo using the manifest:

    `repo init -m <manifest>.xml`
    
    `repo sync -j24`

4) Then proceed to build.

Or alteratively, if you want to do this w/o downloding a file, you can
get the latest known good via a single command:

    repo init -u https://github.com/johnstultz-work/known-good-manifests -m <BOARD>.xml

Then run:

    repo sync -j24
