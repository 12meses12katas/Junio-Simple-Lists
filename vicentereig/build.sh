echo "Building collection.coffee..."
coffee -p collection.coffee > collection.js

echo "Building collection_test.coffee..."
coffee -p collection_test.coffee > collection_test.js
