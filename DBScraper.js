//Dependency: Npm crawler must be installed before this code can run, using 
//  "npm install crawler" from the terminal
//Usage: node newsscraper.js

/*
*   Known Issues: 
*       Need to remove duplicate results before they're stored by checking for same link
*       Need to actually store table of results to Firebase
*/



/*const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp({
  credential: admin.credential.applicationDefault()
});*/



const admin = require('firebase-admin');

var serviceAccount = require('/Users/shanekelley/Documents/Senior\ Year/Spring/Senior\ Sem/donation-app-eef65-2d6a572d8810.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});


const db = admin.firestore();








var Crawler = require('crawler');
var wordlist = ["WOMAN", "FOOT", "MUELLER", "DATA", "COLLEGE"];
//var wordlist = ["FIRE", "AVALANCHE", "STORM"];
//FIXME: May want to use "theguardian.com/world/natural-disasters" instead for the guardian
var sitelist = ["https://abcnews.go.com", "https://apnews.com/apf-topnews",
     "https://theguardian.com/world", "https://cbsnews.com"];
const URL = require('url');

//Results is an Array of Objects containing Title/Link pairs for all 
//  articles with keywords in their titles
var Results = [];

//NOTE: This section will probably be deleted, but its sticking around for now just in case
/*
var website = "";
if (process.argv.length != 3) {
    console.log("WARNING: Please specify a Keyword and Website");
    process.exit(-1);
}
process.argv.forEach(function(val,index,array) {
    switch(index) {
        case 2:
            website = val;
            website = "https://" + website;
            console.log(website);
            break;
        default:
            break;
    }
});
*/

var c = new Crawler({
    // This will be called for each crawled page
    callback : function (error, res, done) {

        if(error){
            console.log(error);
        }
        else{
            var $ = res.$;
            var hit_ctr = 0;
            var this_link = "";
            var listlength = wordlist.length;
            var website = res.request.uri.href;
            
            
            var docRef = db.collection('site').doc('article')
            
            

            //Print formatting
            console.log("===================================");
            console.log("|                                 |");
            console.log("|     The crawler is starting     |"); 
            console.log("|                                 |");
            console.log("===================================");

            // $ is Cheerio by default
            //a lean implementation of core jQuery designed specifically for the server       
            //For loop iterates through each anchor tag

            //CODE FOR CBSNews
            if (website == "https://www.cbsnews.com/"){
                $('body a').each(function(i, elm){
                    //Storing each element's text into a string, and trimming whitespace
                    var str = $($(this).find("h4")).text();
                    str = str.trim();
                    console.log(str);
                    for (var i = 0; i < listlength; i++){
                        //Converting to Upper Case to make strings case-independent
                        if (str.toUpperCase().includes(wordlist[i])){
                            hit_ctr += 1;
                            //console.log("\nTitle: " + str);
                            //Storing the <a href> component of that header into link
                            this_link = $(this).attr("href");

                            var hit = {title: str, link: this_link}
                            Results.push(hit);
                            
                            
                            
                            var data = {
                                title: str,
                                link: this_link,
                            }
                            var setDoc = db.collection('Article').doc(str).set(data)
                            
                            
                            
                        }
                    }   
                });
            }


            //CODE FOR THE GUARDIAN (And all Websites we're using, I guess?)
            else{
                $('body a').each(function(i, elm){
                    //Storing each element's text into a string, and trimming whitespace
                    var str = $(this).text();
                    str = str.trim();
                    for (var i = 0; i < listlength; i++){
                        //Converting to Upper Case to make strings case-independent
                        if (str.toUpperCase().includes(wordlist[i])){
                            hit_ctr += 1;
                            //console.log("\nTitle: " + str);
                            //Storing the <a href> component of that into this_link
                            this_link = $(this).attr("href");

                            //AP News only gives partial link, so need to resolve URL
                            if (website == "https://apnews.com/apf-topnews"){
                                this_link = URL.resolve(website, this_link);
                            }

                            //Pushing title and link of hit to Result array
                            var hit = {title: str, link: this_link}
                            Results.push(hit);
                            
                            var data = {
                                title: str,
                                link: this_link,
                            }
                            var setDoc = db.collection('Article').doc(str).set(data)
                        }
                    }
                });
            }            

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
for (var i=0; i < sitelist.length; i++){
    c.queue(sitelist[i]);
}


//'Drain" event makes following Code only execute when all queued websites have been visited
c.on('drain', function(){
    for (var i in Results){
        console.log(Results[i]);
    }
});
//c.queue(website)