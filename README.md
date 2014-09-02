openig_examples
===============

Sample configuration files for ForgeRock [OpenIG](http://openig.forgerock.org/).

OpenIG is a Java based reverse proxy that specializes in solving Identity Management challenges. For example,
OpenIG can perform the following:
* Act as a SAML Relying Party 
* Authenticate against an OpenID connect provider
* Act as an OAuth 2 resource server
* Perform SSO to legacy web applications using stored credentials. 

For more information on OpenIG refer to the [documentation](http://openig.forgerock.org/doc/webhelp/gateway-guide/index.html)

# Overview

This project contains a number of sample OpenIG configurations to demonstrate various OpenIG features. 

See the README.md in each example directory for an description of each example. 

**Pull requests are welcome!** If you have a neat OpenIG example that you can share, please add it as a
 new example directory and send me a pull request via github. 
 

# Running the examples 

To run these examples you will need to set the OpenIG base location to the root of each example. 
You can do this with a java option to the container (-Dopenig.base=/path/to/openig/config) or set
the OPENIG_BASE environment variable. For example, to test example 1, using Jetty as the container:

```
 java -Dopenig.base=/Users/myhome/src/openig_examples/example1 -jar start.jar 
 ```

# Examples

 
Example  | Description 
---------| -----------
example1 | Demonstrate authentication using the OpenID Connect Filter 



 