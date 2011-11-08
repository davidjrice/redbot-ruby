module Redbot::Headers
  class CacheControl
    include Base

    # @rh.CheckFieldSyntax(syntax.PARAMETER, rh.rfc2616 % "sec-14.9")
    def self.parse(*values)
      new(values)
    end
    
    def initialize(values)
      self.errors = []
      directives = []
      values.each do |directive|
        attr, val = directive.split("=")
        # TODO: warn on upper-cased directives?
        attr.downcase!
        val.gsub!('"', '') if val
        if ['max-age', 's-maxage'].include?(attr)
          begin
            val = Integer(val)
          rescue ArgumentError => e
            val = nil
            alert(INVALID_CACHE_CONTROL_SYNTAX)
          end
        end
        directives.push([attr, val])
      end
      self.value = directives
    end

  end
end

#     The Cache-Control general-header field is used to specify directives that MUST be obeyed by all caching mechanisms along the request/response chain. The directives specify behavior intended to prevent caches from adversely interfering with the request or response. These directives typically override the default caching algorithms. Cache directives are unidirectional in that the presence of a directive in a request does not imply that the same directive is to be given in the response.
# 
#           Note that HTTP/1.0 caches might not implement Cache-Control and
#           might only implement Pragma: no-cache (see section 14.32).
#     Cache directives MUST be passed through by a proxy or gateway application, regardless of their significance to that application, since the directives might be applicable to all recipients along the request/response chain. It is not possible to specify a cache- directive for a specific cache.
# 
#         Cache-Control   = "Cache-Control" ":" 1#cache-directive
#         cache-directive = cache-request-directive
#              | cache-response-directive
#         cache-request-directive =
#                "no-cache"                          ; Section 14.9.1
#              | "no-store"                          ; Section 14.9.2
#              | "max-age" "=" delta-seconds         ; Section 14.9.3, 14.9.4
#              | "max-stale" [ "=" delta-seconds ]   ; Section 14.9.3
#              | "min-fresh" "=" delta-seconds       ; Section 14.9.3
#              | "no-transform"                      ; Section 14.9.5
#              | "only-if-cached"                    ; Section 14.9.4
#              | cache-extension                     ; Section 14.9.6
#          cache-response-directive =
#                "public"                               ; Section 14.9.1
#              | "private" [ "=" <"> 1#field-name <"> ] ; Section 14.9.1
#              | "no-cache" [ "=" <"> 1#field-name <"> ]; Section 14.9.1
#              | "no-store"                             ; Section 14.9.2
#              | "no-transform"                         ; Section 14.9.5
#              | "must-revalidate"                      ; Section 14.9.4
#              | "proxy-revalidate"                     ; Section 14.9.4
#              | "max-age" "=" delta-seconds            ; Section 14.9.3
#              | "s-maxage" "=" delta-seconds           ; Section 14.9.3
#              | cache-extension                        ; Section 14.9.6
#         cache-extension = token [ "=" ( token | quoted-string ) ]
#     When a directive appears without any 1#field-name parameter, the directive applies to the entire request or response. When such a directive appears with a 1#field-name parameter, it applies only to the named field or fields, and not to the rest of the request or response. This mechanism supports extensibility; implementations of future versions of the HTTP protocol might apply these directives to header fields not defined in HTTP/1.1.
# 
#     The cache-control directives can be broken down into these general categories:
# 
#           - Restrictions on what are cacheable; these may only be imposed by
#             the origin server.
#           - Restrictions on what may be stored by a cache; these may be
#             imposed by either the origin server or the user agent.
#           - Modifications of the basic expiration mechanism; these may be
#             imposed by either the origin server or the user agent.
#           - Controls over cache revalidation and reload; these may only be
#             imposed by a user agent.
#           - Control over transformation of entities.
#           - Extensions to the caching system.
