echo "Building lists.coffee..."
coffee -p lists.coffee > lists.js

echo "Building lists_test.coffee..."
coffee -p lists_test.coffee > lists_test.js
