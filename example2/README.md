Example 2 - OAuth2 resource filter 
===============================


This example demonstrates usage of OpenIG's  OAuth2 Resource Server Filter.

Clients are required to present an OAuth access token to OpenIG. If the token 
is valid, OpenIG will pass the REST request on to the backend service. If the token 
is not invalid clients will get a 401 error. 

For our sample REST service we use tinyurl. It does not require any 
authentication - which makes the demo a bit simpler.  
See (see http://scripting.com/stories/2007/06/27/tinyurlHasAnApi.html)


# Prerequisites

You will need to setup an OAuth provider that can issue access tokens. This is not 
part of this example. This is quite easy to setup using OpenAM. Simply create an
OAuth client (Realm -> Agents -> OAuth).  


# Testing 

For your convenience there are two shell scripts that can be used to test the sample 
service:

```getaccess.sh```  Get's an access token from OpenAM using the resource owner credentials flow.
Assume that you have a subject  demo/password

```testaccess.sh```  Cut an paste the access token from the previous script and use it as
a command line argument to this script.  It will first call OpenAMs tokeninfo endpoint 
to verify that is working, and then will call out to OpenIG to invoke the sample REST 
service.  If for some reason the first call to OpenAM does not work - you must fix that 
first before debugging OpenIG. 


# How it works 

```config.json```  - contains the top level configuration which consists of a few utility filters to 
perform capture (to /tmp/gateway.log) and output DEBUG information to the containers stdout. 

```routes/short.json```  - Configures the OAuth2 Resource Server Filter chain. Edit the tokenInfoEndpoint
to match your OAuth provider.  The chain is written to extract the original request parameters
and pass them along to the tinyurl service.  tinyurl expects a ?url=http://my.url.com format.





