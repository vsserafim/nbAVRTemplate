#!/bin/bash

ORIGNAME="nbAVRTemplate"

if [ $# -ne 1 ]; then
	echo "Usage: $0 <project_name>"
	exit 1
fi

echo "*** Removing git repository..."
rm -rf .git

echo "*** Cleaning all build files..."
make clobber

echo "*** Renaming the project..."
cd nbproject
for f in *; do
	echo $f
	sed s/${ORIGNAME}/$1/g $f > $f.tmp; mv $f.tmp $f
done

cd ..

echo "*** Removing $0..."
rm setup.sh

echo Done!

