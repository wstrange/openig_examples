Example1 - OIDC Authentication
===============================


This example demonstrates OpenIG's OpenID Connect (OIDC) Authentication Filter.


The example is configured to use Google+ OIDC Authentication. To run the example you must first register your own client
with google. 

To create a client go to the [google Cloud console]
(https://console.developers.google.com/project?utm_referrer=blank) and 
navigate to "Credentials" under APIs & Auth.  Take the client id and client secret that you obtain 
and put them in the file env.sh. env.template is a starting template that you can use for the samples.

You will also have to ensure the callback URL registered with google matches your OpenIG install. For example, if you are 
running the OpenIG examples on Jetty on port 9080 on your local desktop, the callback URL is
```http://localhost:9080/openid/callback```

For Javascript orgins I use "http://localhost/"



# How it works 

```config.json```  - contains the top level configuration which consists of a few utility filters to 
perform capture (to /tmp/gateway.log) and output DEBUG information to the containers stdout. 

```routes/default.json```  - is a default handler that matches any request. It simply returns an
html page that shows the user_info object that is placed in the session. The first time
you run this example, the user will not have been authenticated, and this object will be null. 

```routes/openid.json```  configures the OpenID Connect filter. This filter checks for the presence of
a jwt token cookie that contains the authenticated user information 
(open up Chrome dev tools to see this). If the cookie is missing, the filter 
forwards the user to the OIDC provider for authentication. Once authenticated, the OIDC provider will
send the user back to the OIDC handler (openid/callback). 

Note that the OIDC provider
(Google in this example) will only return a user to a callback URL that is properly registered.  
For example, in my sample client configuration on google I registered http://localhost:9080/openid/callback
as the callback (my OpenIG example is running on a laptop in a local container). 

This route is also configured to write the user info obtained from the OIDC provider to the session. 

# Routing

Note that OpenIG accepts the *first* route that matches a request, and it evaluates routes in 
name lexicographical order.  This is why this default filter is named "zDefault" (z being
at the end of the alphabet).  If 
(for example) the default filter was called "aDefault" - our OpenID filter would never run. 
The default filter would always take precedence since it matches any request, and is evaluated first. 


