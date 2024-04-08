FROM wordpress:php8.3-apache

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY docker/apache/default.conf /etc/apache2/sites-available/wordpress.conf

RUN a2ensite wordpress.conf \
    && a2enmod rewrite

ENV APACHE_DOCUMENT_ROOT /var/www/html

COPY docker/wordpress/setup-wp-files.sh /usr/local/bin/setup-wp-files
RUN chmod +x /usr/local/bin/setup-wp-files \
 && setup-wp-files
