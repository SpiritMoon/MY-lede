#!/bin/sh
    
    if [ -z "$(grep '^  enhanced-mode: $2' "$7")" ]; then
       if [ ! -z "$(grep "^  enhanced-mode:" "$7")" ]; then
          sed -i "/^  enhanced-mode:/c\  enhanced-mode: ${2}" "$7"
       else
          sed -i "/^dns:/a\  enhanced-mode: ${2}" "$7"
       fi
    fi
    
    if [ "$2" = "fake-ip" ]; then
       if [ ! -z "$(grep "^ \{0,\}fake-ip-range:" "$7")" ]; then
          sed -i "/^ \{0,\}fake-ip-range:/c\  fake-ip-range: 198.18.0.1/16" "$7"
       else
          sed -i "/enhanced-mode:/a\  fake-ip-range: 198.18.0.1/16" "$7"
       fi
    else
       sed -i '/^ \{0,\}fake-ip-range:/d' "$7"  2>/dev/null
    fi
    
    sed -i '/##Custom DNS##/d' "$7" 2>/dev/null


    if [ -z "$(grep '^redir-port: $6' "$7")" ]; then
       if [ ! -z "$(grep "^redir-port:" "$7")" ]; then
          sed -i "/^redir-port:/c\redir-port: ${6}" "$7"
       else
          sed -i "3i\redir-port: ${6}" "$7"
       fi
    fi
    
    if [ -z "$(grep '^port: $9' "$7")" ]; then
       if [ ! -z "$(grep "^port:" "$7")" ]; then
          sed -i "/^port:/c\port: ${9}" "$7"
       else
          sed -i "3i\port: ${9}" "$7"
       fi
    fi
    
    if [ -z "$(grep '^socks-port: $10' "$7")" ]; then
       if [ ! -z "$(grep "^socks-port:" "$7")" ]; then
          sed -i "/^socks-port:/c\socks-port: ${10}" "$7"
       else
          sed -i "3i\socks-port: ${10}" "$7"
       fi
    fi
    
    if [ -z "$(grep '^external-controller: 0.0.0.0:$5' "$7")" ]; then
       if [ ! -z "$(grep "^external-controller:" "$7")" ]; then
          sed -i "/^external-controller:/c\external-controller: 0.0.0.0:${5}" "$7"
       else
          sed -i "3i\external-controller: 0.0.0.0:${5}" "$7"
       fi
    fi
    
    if [ -z "$(grep '^secret: $4' "$7")" ]; then
       if [ ! -z "$(grep "^secret:" "$7")" ]; then
          sed -i "/^secret:/c\secret: '${4}'" "$7"
       else
          sed -i "3i\secret: '${4}'" "$7"
       fi
    fi

    if [ -z "$(grep "^   enable: true" "$7")" ]; then
       if [ ! -z "$(grep "^ \{0,\}enable:" "$7")" ]; then
          sed -i "/^ \{0,\}enable:/c\  enable: true" "$7"
       else
          sed -i "/^dns:/a\  enable: true" "$7"
       fi
    fi
    
    if [ -z "$(grep "^allow-lan: true" "$7")" ]; then
       if [ ! -z "$(grep "^allow-lan:" "$7")" ]; then
          sed -i "/^allow-lan:/c\allow-lan: true" "$7"
       else
          sed -i "3i\allow-lan: true" "$7"
       fi
    fi
    
    if [ -z "$(grep '^external-ui: "/usr/share/openclash/dashboard"' "$7")" ]; then
       if [ ! -z "$(grep "^external-ui:" "$7")" ]; then
          sed -i '/^external-ui:/c\external-ui: "/usr/share/openclash/dashboard"' "$7"
       else
          sed -i '3i\external-ui: "/usr/share/openclash/dashboard"' "$7"
       fi
    fi

    if [ "$8" -eq 1 ]; then
       if [ -z "$(grep "  ipv6: true" "$7")" ]; then
          if [ ! -z "$(grep "^ \{0,\}ipv6:" "$7")" ]; then
             sed -i "/^ \{0,\}ipv6:/c\  ipv6: true" "$7"
          else
             sed -i "/^ \{0,\}enable: true/i\  ipv6: true" "$7"
          fi
       fi
    else
       if [ -z "$(grep "  ipv6: false" "$7")" ]; then
          if [ ! -z "$(grep "^ \{0,\}ipv6:" "$7")" ]; then
             sed -i "/^ \{0,\}ipv6:/c\  ipv6: false" "$7"
          else
             sed -i "/^ \{0,\}enable: true/a\  ipv6: false" "$7"
          fi
       fi
    fi
