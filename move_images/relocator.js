/*  Simple script to move files from one folder to another based on year/month
 *  Source directoy is called source. This should contain all the files.
 *  Destination directory is called moved. This will be the final destination of the copied files.
 *  Only check for files with a date format in the filename e.g 20190103-0100 etc 
 */
const fs = require('fs');
const path = require('path');
const srcDir = path.join(__dirname, 'source');
const destDir = path.join(__dirname, 'moved');

// Months Array
const months = ['01-January',
                '02-February',
                '03-March',
                '04-April',
                '05-May',
                '06-June',
                '07-July',
                '08-August',
                '09-September',
                '10-October',
                '11-November',
                '12-December'
                ];


// Check if root destination dir is present. If not, create it
if(!fs.existsSync(`${destDir}`))
                fs.mkdirSync(destDir);

fs.readdir(srcDir, function(err, files) {
    if(err)
        throw err;
    let regex = new RegExp(/[^\\_-][^\\_-]*[_-]20[0-9][0-9][01][0-9][0-3][0-9][_-][^\\]*/);

    files.forEach((item) => {
        //console.warn("File name is: ", item);
        if(regex.test(item) ) {
            console.log(item);
            let pos = item.indexOf("_20");
            let year = item.slice(pos+1, pos+5);
            let month = item.slice(pos+6, pos+7);
            // Create Year folder
            if(!fs.existsSync(`${destDir}/${year}`)) {
                    fs.mkdirSync(`${destDir}/${year}`);
            }
            // Create month folder
            if(!fs.existsSync(`${destDir}/${year}/${months[month - 1]}`)) {
                fs.mkdirSync(`${destDir}/${year}/${months[month - 1]}`);
            }

            // Copy files from original folder to the destination folder
            fs.copyFileSync(`${srcDir}/${item}`, `${destDir}/${year}/${months[month - 1]}/${item}`);
            console.log("year: " + year + " month: " + months[month - 1]);
        }

    });
    
});