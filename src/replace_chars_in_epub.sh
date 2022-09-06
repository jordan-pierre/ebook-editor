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
for EPUB in inputs/*.epub 
do
    echo $EPUB
    mv "$EPUB" ${EPUB// /_}
    EPUB=${EPUB// /_}

    regex="inputs/(.*).epub"
    [[ $EPUB =~ $regex ]]
    FILE_ROOT=${BASH_REMATCH[1]}

    # 2. Convert `epub` file to `zip` file
    mkdir -p tmp/
    TEMP_ZIP="tmp/$FILE_ROOT.zip"
    echo "cp" $EPUB $TEMP_ZIP

    cp $EPUB $TEMP_ZIP

    # 3. Un-zip new `zip` file
    mkdir -p tmp/$FILE_ROOT/
    unzip $TEMP_ZIP -d tmp/$FILE_ROOT

    # 4. Open all `xhtml` file in unzipped directory
    for FILE in tmp/$FILE_ROOT/OEBPS/*.xhtml
    do
        # 5. Replace all instances of original character with desired character
        echo $FILE
        sed -i "s/’/'/g" $FILE
        sed -i "s/“/\"/g" $FILE
        sed -i "s/”/\"/g" $FILE
        sed -i "s/—/-/g" $FILE
        sed -i "s/ //g" $FILE
        # while read -r LINE; do
        #     echo -e $LINE
        # done < $FILE
    done

    # 6. Re-zip directory as `epub` file
    NEW_EPUB=$FILE_ROOT.epub
    cd tmp/$FILE_ROOT
    zip -rX ../$NEW_EPUB mimetype META-INF/ OEBPS/

    cd ../..
    mkdir -p outputs/ 
    mv tmp/$NEW_EPUB outputs/$NEW_EPUB
done
