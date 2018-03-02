# known-good-manifests
Snapshots of "known-good" AOSP manifests for various devboards

Where "known-good" means that basic functionality has been checked and it should be ok for development work.

To use:

1) Go to your already checked out AOSP TOPDIR
   * If you need help setting up a build environment and checking out the AOSP source, please refer to the AOSP instructions here:
   
       [`https://source.android.com/setup/requirements`](https://source.android.com/setup/requirements)

   * Also review the instruction details specifically for devboards:

       [`https://source.android.com/setup/devices`](https://source.android.com/setup/devices)

2) Download the known-good manifest you wish to use.
   Manifests can be found under the board directories here:

     [`https://github.com/johnstultz-work/known-good-manifests/tree/master/known-good`](https://github.com/johnstultz-work/known-good-manifests/tree/master/known-good)

   And the latest known-good manifest can be accessed via:

     [`https://github.com/johnstultz-work/known-good-manifests/tree/master/latest/<BOARD>.xml`](https://github.com/johnstultz-work/known-good-manifests/tree/master/latest/)

3) Initialize & sync the repo using the manifest:

    `repo sync -j24 -m <MANIFEST>.xml`
    
4) Then proceed to build.


To switch back to AOSP/master:

1) Go to your already checked out AOSP TOP_DIR

2) Re-Initialize and sync the repo using the AOSP/master manifest:

    `repo sync -j24`

