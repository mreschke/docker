## New SSL Cert

* Purchase a wildcard SSL cert from Godaddy account
* On lb, create a new CSR
```
openssl genrsa -out sunfinityre.com.key 2048  #This makes a new 2048bit private key
openssl req -new -key sunfinityre.com.key -out sunfinityre.com.csr  #This makes a CSR based on the new key
    # Country Name (2 letter code) [US]:
    # State or Province Name (full name) [Texas]:
    # Locality Name (eg, city) [Dallas]:
    # Organization Name (eg, company) [Sunfinity]:
    # Organizational Unit Name (eg, section) [Information Technology]:
    # Common Name (e.g. server FQDN or YOUR name) []: *.sunfinityre.com
    # Email Address []: it@sunfinityre.com
    # A challenge password []: nothing
    # An optional company name []: nothing
```
* Paste the full text of the .csr file (including the ---BEGIN...) into godaddy they will send you an email
when they verify you.
* Once verified go to SSL control panel, find the new sunfinityre.com ssl line and click download, select tomcat as download, should be a .zip containing xxxxx.crt, gd_bundle_g2-g1.crt and gdig2.crt
* Concat the .crt, .intr1.crt and .key in that order into a new .pem file
```
mv gdig2.crt sunfinityre.com.intr1.crt
mv 5c6a8db618708367.crt sunfinityre.com.crt
cat sunfinityre.com.crt sunfinityre.com.intr1.crt sunfinityre.com.key > sunfinityre.com.pem
rm gd_bundle-g2-g1.crt
```
* Now simply copy that `sunfinityre.com.pem` file into lb `/etc/haproxy/ssl/certs` and `reload` haproxy




## Renew SSL Cert

When you renew, you do NOT create a new private key, you re-use the original .key you created for this domain.

* Renew on godaddy, and download the new .zip for "Tomcat" server type
* Copy over your EXISTING original `sunfinityre.com.key` file, you always re-use your original private key unless you are "re-keying"
```
mv gdig2.crt.pem sunfinityre.com.intr1.crt
mv 470f869ad9cd8d41.crt sunfinityre.com.crt
cat sunfinityre.com.crt sunfinityre.com.intr1.crt sunfinityre.com.key > sunfinityre.com.pem
rm gd_bundle-g2-g1.crt
```
* Now simply copy that `sunfinityre.com.pem` file into dynalb `/etc/haproxy/ssl/certs` and `reload` haproxy



## Re-key SSL Cert

A re-key is essentially like a new SSL cert.  You have to create a brand NEW .key, and new CSR...the whole thing.

