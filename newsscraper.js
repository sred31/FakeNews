//Dependency: Npm crawler must be installed before this code can run, using 
//  "npm install crawler" from the terminal
//Usage: node newsscraper.js <website link>


/*
*   Known Issues: 
*      Currently only evaluates h1's, other websites will use other header tags
*      Results need to be stored in arrays/tables rather than just logged to console
*/
var Crawler = require('crawler');
var wordlist = ["WOMAN", "FOOT", "FACEBOOK", "DATA", "COLLEGE"];
//var website = 'http://abcnews.go.com/';
var website = "";
if (process.argv.length != 3) {
    console.log("WARNING: Please specify a Keyword and Website");
    process.exit(-1);
}
process.argv.forEach(function(val,index,array) {
    switch(index) {
        /*
        case 2:
            keyword = val;
            keyword = keyword.toUpperCase();
            break;
        */
        case 2:
            website = val;
            website = "https://" + website;
            console.log(website);
            break;
        default:
            break;
    }
});


var c = new Crawler({
    // This will be called for each crawled page
    callback : function (error, res, done) {

        if(error){
            console.log(error);
        }
        else{
            //var keyword = "trump"
            //keyword = keyword.toUpperCase();
            var $ = res.$;
            var hit_ctr = 0;
            var link = "";
            var listlength = wordlist.length;

            //Print formatting
            console.log("===================================");
            console.log("|                                 |");
            console.log("|     The crawler is starting     |"); 
            console.log("|                                 |");
            console.log("===================================");

            // $ is Cheerio by default
            //a lean implementation of core jQuery designed specifically for the server       
            //For loop iterates through each H1 Header
            $('body h1').each(function(i, elm){
                //Storing each element's text into a string, and trimming whitespace
                var str = $(this).text();
                str = str.trim();
                for (var i = 0; i < listlength; i++){
                    //Converting to Upper Case to make strings case-independent
                    if (str.toUpperCase().includes(wordlist[i])){
                        hit_ctr += 1;
                        console.log("\nTitle: " + str);
                        //Storing the <a href> component of that header into link
                        link = $($(this).find("a")).attr("href");
                        console.log("Link: " + link);
                    }
                }
            });
            console.log("===================================");
            console.log("|                                 |");
            console.log("|            Finished             |");
            console.log("|                                 |");
            console.log("===================================");
            console.log("Found " + hit_ctr + " results");
        }
        done();
    }
});
// Queue just one URL, with default callback
c.queue(website);