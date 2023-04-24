FROM ubuntu:20.04

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ="Etc/UTC"
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get update && \
	apt-get install -y -qq --no-install-recommends \
	build-essential\
	cmake \
	ruby-full &&\
	rm -rf /var/lib/apt/lists/*

COPY Gemfile /Gemfile

RUN gem install bundler --quiet --no-document > /dev/null && \
    mkdir -p /.fastlane && \
    chmod 777 /.fastlane && \
    bundle install --quiet
	
CMD ["fastlane", "-v"]