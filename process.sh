#!/bin/sh

echo "executing 'ssh -NT -L $localBinding:$remoteBinding $remoteName'"
ssh -NT -L $localBinding:$remoteBinding $remoteName
