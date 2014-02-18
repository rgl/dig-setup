This setup installs the dig (domain information groper) tool for querying Domain Name System (DNS) name servers.

Download it at https://bitbucket.org/rgl/dig-setup/downloads.


# Common usages


## Name to Address

    dig ruilopes.com

```
; <<>> DiG 9.9.5-W1 <<>> ruilopes.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 59608
;; flags: qr rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;ruilopes.com.                  IN      A

;; ANSWER SECTION:
ruilopes.com.           755     IN      A       198.199.127.14

;; Query time: 6 msec
;; SERVER: 192.168.2.1#53(192.168.2.1)
;; WHEN: Tue Feb 18 11:49:07 GMT Standard Time 2014
;; MSG SIZE  rcvd: 46
```


## Name to Address (direct query)

    dig ruilopes.com @8.8.8.8

```
; <<>> DiG 9.9.5-W1 <<>> ruilopes.com @8.8.8.8
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62523
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;ruilopes.com.                  IN      A

;; ANSWER SECTION:
ruilopes.com.           1797    IN      A       198.199.127.14

;; Query time: 54 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Tue Feb 18 11:46:16 GMT Standard Time 2014
;; MSG SIZE  rcvd: 57
```


## Address to Name

Find out if a given IP address has a DNS PTR RR:

	dig -x 198.199.127.14

```
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44815
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1280
;; QUESTION SECTION:
;14.127.199.198.in-addr.arpa.   IN      PTR

;; ANSWER SECTION:
14.127.199.198.in-addr.arpa. 86400 IN   PTR     moon.ruilopes.com.

;; Query time: 76 msec
;; SERVER: 192.168.2.1#53(192.168.2.1)
;; WHEN: Tue Feb 18 11:49:15 GMT Standard Time 2014
;; MSG SIZE  rcvd: 87
```

NB this is equivalent of doing `dig 14.127.199.198.in-addr.arpa.`.


## Specific DNS RR type

You can query for specific [DNS Resource Records](http://en.wikipedia.org/wiki/Resource_record#DNS_resource_records). e.g. to known which email servers handle a domain, you want to retrieve the [MX (Mail Exchanger)](http://en.wikipedia.org/wiki/MX_record) DNS RR with:

	dig mx ruilopes.com

```
; <<>> DiG 9.9.5-W1 <<>> mx ruilopes.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 41403
;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1280
;; QUESTION SECTION:
;ruilopes.com.                  IN      MX

;; ANSWER SECTION:
ruilopes.com.           300     IN      MX      5 ALT2.ASPMX.L.GOOGLE.com.
ruilopes.com.           300     IN      MX      10 ASPMX2.GOOGLEMAIL.com.
ruilopes.com.           300     IN      MX      10 ASPMX3.GOOGLEMAIL.com.
ruilopes.com.           300     IN      MX      1 ASPMX.L.GOOGLE.com.
ruilopes.com.           300     IN      MX      5 ALT1.ASPMX.L.GOOGLE.com.

;; Query time: 206 msec
;; SERVER: 192.168.2.1#53(192.168.2.1)
;; WHEN: Tue Feb 18 12:02:24 GMT Standard Time 2014
;; MSG SIZE  rcvd: 171
```

NB you can also use `any` to retrieve all resource records of all types known to the name server.
