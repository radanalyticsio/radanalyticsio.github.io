# Archived resources.yaml versions

This is a list of resource files that
can be used to install templates for specific Oshinko releases.
Each file is listed below with the Oshinko release it
installs by default and other releases which it supports.

# Changing the release installed by a resources file 

A `resources.yaml` file can be changed to create templates
for any supported Oshinko release. This is done by modifying
the tags on the Oshinko images referenced in the file. You
can do this with a text editor and then pass the resulting file
to *oc create*, or you can use shell commands like this:

```bash
# The url of the resources.yaml you wish to use
RESOURCES_URL=https://radanalytics.io/resources.yaml

# The default tag that file uses for Oshinko images (listed below)
DEFAULT_TAG=stable

# The Oshinko version to use as the new tag (v9.9.9 is made up)
NEW_TAG=v9.9.9

# Create a modified file and pass it directly to oc create
wget $RESOURCES_URL -qO - \
| sed -r -e "s@(radanalyticsio/.*:)($DEFAULT_TAG)@\1$NEW_TAG@" | oc create -f -
```
  
https://radanalytics.io/resources.yaml  
This is the latest resources file from [radanalytics.io](https://radanalytics.io)  
DEFAULT_TAG=stable  
NEW_TAG may be any version newer than v0.3.1
  
https://radanalytics.io/openshift/resources-v0.3.yaml  
This file supports versions v0.2.x and v0.3.x of Oshinko  
DEFAUT_TAG=v0.3.1  
NEW_TAG may be any version from v0.2.6 to v0.3.1 inclusive

https://radanalytics.io/openshift/resources-2017-4-0.yaml  
This file installs a demo release from April of 2017 and is
not valid for any other version.

https://radanalytics.io/openshift/resources-2017-6-0.yaml  
This file installs a demo release from June of 2017 and is
not valid for any other version
