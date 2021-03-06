shibboleth:
  server:
    enabled: true
    keystone_protocol: http
    keystone_public_address: ${_param:proxy_vip_address_public}
    keystone_port: 5000
    idp_url: "https://saml.example.com/oam/fed"
    idp_metadata_url: "https://saml.example.com/oamfed/idp/metadata"
    attributes:
    - name: test
      id: test
      name_format: urn:oasis:names:tc:SAML:2.0:attrname-format:basic
apache:
  server:
    enabled: true
    default_mpm: event
    site:
      keystone:
        enabled: true
        type: keystone
        name: wsgi
        host:
          name: test
    pkgs:
      - apache2
      - libapache2-mod-shib2
    modules:
      - wsgi
      - shib2
