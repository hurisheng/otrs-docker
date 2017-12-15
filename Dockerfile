FROM centos:latest

LABEL author="hurisheng"

ENV OTRS_VERSION="6.0.2-03"

RUN curl -o /tmp/otrs.rpm http://ftp.otrs.org/pub/otrs/RPMS/rhel/7/otrs-${OTRS_VERSION}.noarch.rpm \
  && yum -y update && yum -y install epel-release \
  && yum -y install /tmp/otrs.rpm \
  && yum -y install "perl(YAML::XS)" "perl(Text::CSV_XS)" "perl(ModPerl::Util)" \
  "perl(Authen::NTLM)" "perl(Mail::IMAPClient)" "perl(JSON::XS)" \
  "perl(Encode::HanExtra)" "perl(DBD::mysql)" "perl(Crypt::Eksblowfish::Bcrypt)" \
  && rm /tmp/otrs.rpm