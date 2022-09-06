#!/bin/sh


# ## Strategy
# 1. Take `epub` file
# 2. Convert `epub` file to `zip` file
# 3. Un-zip new `zip` file
# 4. Open all `xhtml` file in unzipped directory
# 5. Replace all instances of original character with desired character
# 6. Re-zip directory to `zip` file
# 7. Convert `zip` file to `epub`

# 1. Take `epub` file
FILE_ROOT="the_obstacle_is_the_way" # TODO: loop for all `.epub` files in `inputs/` directory
INPUT_FILE="inputs/$FILE_ROOT.epub"

# 2. Convert `epub` file to `zip` file
mkdir -p tmp/
TEMP_ZIP="tmp/$FILE_ROOT.zip"

cp $INPUT_FILE $TEMP_ZIP

# 3. Un-zip new `zip` file
mkdir -p tmp/$FILE_ROOT/
unzip $TEMP_ZIP -d tmp/$FILE_ROOT

# 4. Open all `xhtml` file in unzipped directory
for FILE in tmp/$FILE_ROOT/OEBPS/*.xhtml
do
    # 5. Replace all instances of original character with desired character
    echo $FILE
done