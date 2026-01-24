FROM nginx:alpine

# Install apache2-utils for htpasswd command
RUN apk add --no-cache apache2-utils

# Copy static website files
COPY index.html /usr/share/nginx/html/
COPY content.json /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/ 2>/dev/null || true
COPY script.js /usr/share/nginx/html/ 2>/dev/null || true
COPY *.png /usr/share/nginx/html/ 2>/dev/null || true

# Copy nginx configuration with Basic Auth
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy robots.txt
COPY robots.txt /usr/share/nginx/html/

# Generate htpasswd file (username: louise, password: LØVINDE2026)
# Using bcrypt for security
RUN htpasswd -cb /etc/nginx/.htpasswd louise 'LØVINDE2026'

# Expose port 80 (Coolify proxy handles HTTPS)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
