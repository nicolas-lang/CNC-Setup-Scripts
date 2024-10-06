const fs = require('fs');
const path = require('path');

// Path to the GrblController.js file
const filePath = '/usr/lib/node_modules/cncjs/dist/cncjs/server/controllers/Grbl/GrblController.js';

// Read the file content
fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error(`Error reading file: ${err}`);
        return;
    }

    // The condition you want to find and modify
    const targetCondition = `if (_.includes(words, 'M6')) {`;
    const patchedCondition = `if (_.includes(words, 'M6') && false) {`;

    // Check if the condition is present
    if (data.includes(targetCondition)) {
        // Replace the target condition with the patched condition
        const patchedData = data.replace(targetCondition, patchedCondition);

        // Write the modified content back to the file
        fs.writeFile(filePath, patchedData, 'utf8', (err) => {
            if (err) {
                console.error(`Error writing to file: ${err}`);
                return;
            }
            console.log(`File successfully patched!`);
        });
    } else {
        console.log('Target condition not found in the file.');
    }
});
