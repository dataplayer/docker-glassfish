FROM glassfish:4.1-jdk8

RUN echo "AS_ADMIN_PASSWORD=" > /tmp/pass
RUN echo "AS_ADMIN_NEWPASSWORD=admin" >> /tmp/pass
RUN echo "ADMIN_PASSWORD=admin" > /tmp/pass2
RUN echo "ADMIN_NEWPASSWORD=admin" >> /tmp/pass2
RUN /usr/local/glassfish4/bin/asadmin --user admin --passwordfile /tmp/pass change-admin-password --domain_name domain1
RUN /user/local/glassfish4/bin/asadmin --passwordfile /tmp/pass2 enable-secure-admin
RUN asadmin stop-domain

CMD asadmin start-domain --verbose
