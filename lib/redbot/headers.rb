require "redbot/headers/base"
require "redbot/headers/accept_ranges"
require "redbot/headers/allow"
require "redbot/headers/age"
require "redbot/headers/last_modified"

module Redbot

  module Headers
    # List extracted from (http://en.wikipedia.org/wiki/List_of_HTTP_header_fields)
    #
    # As defined in the HTTP 1.1 spec (http://www.w3.org/Protocols/rfc2616/rfc2616.html)
    #

    # Accept-Ranges 
    #   What partial content range types this server supports
    #   Accept-Ranges: bytes
    # Age
    #   The age the object has been in a proxy cache in second
    #   Age: 12
    # Allow
    #   Valid actions for a specified resource. To be used for a 405 Method not allowed
    #   Allow: GET, HEAD
    # Cache-Control
    #   Tells all caching mechanisms from server to client whether they may cache this object. 
    #   It is measured in seconds
    #   Cache-Control: max-age=3600
    # Connection
    #   Options that are desired for the connection[4]
    #   Connection: close
    # Content-Encoding
    #   The type of encoding used on the data. See HTTP compression.
    #   Content-Encoding: gzip
    # Content-Language
    #   The language the content is in
    #   Content-Language: da
    # Content-Length
    #   The length of the response body in octets (8-bit bytes)
    #   Content-Length: 348
    # Content-Location
    #   An alternate location for the returned data
    #   Content-Location: /index.htm
    # Content-MD5
    #   A Base64-encoded binary MD5 sum of the content of the response
    #   Content-MD5: Q2hlY2sgSW50ZWdyaXR5IQ==
    # Content-Disposition
    #   An opportunity to raise a "File Download" dialogue box for a known MIME type
    #   Content-Disposition: attachment; filename=fname.ext
    # Content-Range
    #   Where in a full body message this partial message belongs
    #   Content-Range: bytes 21010-47021/47022
    # Content-Type
    #   The mime type of this content
    #   Content-Type: text/html; charset=utf-8
    # Date
    #   The date and time that the message was sent
    #   Date: Tue, 15 Nov 1994 08:12:31 GMT
    # ETag
    #   An identifier for a specific version of a resource, often a message digest
    #   ETag: "737060cd8c284d8af7ad3082f209582d"
    # Expires
    #   Gives the date/time after which the response is considered stale
    #   Expires: Thu, 01 Dec 1994 16:00:00 GMT
    # Last-Modified
    #   The last modified date for the requested object, in RFC 2822 format
    #   Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT
    # Link
    #   Used to express a typed relationship with another resource, where the relation type is defined by RFC 5988
    #   Link: </feed>; rel="alternate"
    # Location
    #   Used in redirection, or when a new resource has been created.
    #   Location: http://www.w3.org/pub/WWW/People.html
    # P3P
    #   This header is supposed to set P3P policy, in the form of P3P:CP="your_compact_policy". 
    #   However, P3P did not take off,[5] most browsers have never fully implemented it, a lot of websites set this     
    #   header with fake policy text, that was enough to fool browsers the existence of P3P policy and grant   
    #   permissions for third party cookies.
    #   P3P: CP="This is not a P3P policy!
    #   See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657"
    # Pragma
    #   Implementation-specific headers that may have various effects anywhere along the request-response chain.
    #   Pragma: no-cache
    # Proxy-Authenticate
    #   Request authentication to access the proxy.
    #   Proxy-Authenticate: Basic
    # Refresh
    #   Used in redirection, or when a new resource has been created. 
    #   This refresh redirects after 5 seconds. This is a proprietary, non-standard header extension introduced by     
    #   Netscape and supported by most web browsers.
    #   Refresh: 5; url=http://www.w3.org/pub/WWW/People.html
    # Retry-After
    #   If an entity is temporarily unavailable, this instructs the client to try 
    #   again after a specified period of time.
    #   Retry-After: 120
    # Server
    #   A name for the server
    #   Server: Apache/1.3.27 (Unix) (Red-Hat/Linux)
    # Set-Cookie
    #   an HTTP cookie
    #   Set-Cookie: UserID=JohnDoe; Max-Age=3600; Version=1
    # Strict-Transport-Security
    #   A HSTS Policy informing the HTTP client how long to cache the HTTPS only policy and 
    #   whether this applies to subdomains.
    #   Strict-Transport-Security: max-age=16070400; includeSubDomains
    # Trailer
    #   The Trailer general field value indicates that the given set of header fields is 
    #   present in the trailer of a message encoded with chunked transfer-coding.
    #   Trailer: Max-Forwards
    # Transfer-Encoding
    #   The form of encoding used to safely transfer the entity to the user. 
    #   Currently defined methods are: chunked, compress, deflate, gzip, identity.
    #   Transfer-Encoding: chunked
    # Vary
    #   Tells downstream proxies how to match future request headers to decide 
    #   whether the cached response can be used rather than requesting a fresh one from the origin server.
    #   Vary: *
    # Via
    #   Informs the client of proxies through which the response was sent.
    #   Via: 1.0 fred, 1.1 nowhere.com (Apache/1.1)
    # Warning
    #   A general warning about possible problems with the entity body.
    #   Warning: 199 Miscellaneous warning
    # WWW-Authenticate
    #   Indicates the authentication scheme that should be used to access the requested entity.
    #   WWW-Authenticate: Basic


    # X-Frame-Options
    #   Clickjacking protection: "deny" - no rendering within a frame, "sameorigin" - no rendering if origin mismatch	
    #   X-Frame-Options: deny
    # X-XSS-Protection[
    #   Cross-site scripting (XSS) filter
    #   X-XSS-Protection: 1; mode=block
    # X-Content-Type-Options
    #   the only defined value, "nosniff", prevents Internet Explorer from MIME-sniffing a response 
    #   away from the declared content-type
    #   X-Content-Type-Options: nosniff
    # X-Forwarded-For
    #   a de facto standard for identifying the originating IP address of a client connecting to a web server
    #   through an HTTP proxy or load balancer
    #   X-Forwarded-For: client1, proxy1, proxy2
    # X-Forwarded-Proto
    #   a de facto standard for identifying the originating protocol of an HTTP request, since a reverse proxy 
    #   (load balancer) communicates with a web server using HTTP
    #   X-Forwarded-Proto: https
    # X-Powered-By
    #   specifies the technology (ASP.NET, PHP, JBoss, e.g.) supporting the web application
    #  (version details are often in X-Runtime, X-Version, or X-AspNet-Version)
    #  X-Powered-By: PHP/5.2.1
  end

end