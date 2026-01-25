FROM nginx:alpine

# Copy static website files
COPY index.html /usr/share/nginx/html/
COPY content.json /usr/share/nginx/html/
COPY louise-portrait.jpg /usr/share/nginx/html/

# Copy nginx configuration with Basic Auth
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy robots.txt
COPY robots.txt /usr/share/nginx/html/

# Create htpasswd file with pre-generated bcrypt hash
# Username: louise, Password: LØVINDE2026
RUN echo 'louise:$2y$05$qeLy7XUMpP3dg4YL5FeP0e4O3Ucai/HaUrRR7rj3grbI7P2oLD10.' > /etc/nginx/.htpasswd

# Expose port 80 (Coolify proxy handles HTTPS)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
