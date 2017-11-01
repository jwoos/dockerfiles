#!/usr/bin/env bash

set -eu

# import python realease managers and binary buildesr keys
printf 'Receiving public keys from pgp.mit.edu\n'
gpg --keyserver hkp://pgp.mit.edu \
	--recv-keys \
	6A45C816 \
	36580288 \
	7D9DC8D2 \
	18ADD4FF \
	A4135B38 \
	A74B06BF \
	EA5BBD71 \
	E6DF025C \
	AA65421D \
	6F5E1540 \
	F73C700D \
	487034E5 &> /dev/null

VERSIONS=(
	'3.6.3'
	'3.5.4'
	'3.4.4'
	'2.7.14'
)

for VERSION in "${VERSIONS[@]}"; do
	MAJOR_MINOR=$(printf ${VERSION} | sed -re 's/.[0-9]+$//')

	DIR="Python-${VERSION}"
	FILE="${DIR}.tar.xz"
	SIG="${FILE}.asc"
	URL="https://www.python.org/ftp/python/${VERSION}/${FILE}"
	SIG_URL="${URL}.asc"

	printf "Installing Python ${VERSION}\n"
	wget $URL &> /dev/null
	wget $SIG_URL &> /dev/null

	printf 'Verifying file\n'
	gpg --verify ${SIG} ${FILE} &> /dev/null
	tar xf ${FILE}

	pushd ${DIR} &> /dev/null
	printf 'Running configure\n'
	./configure --prefix=/opt/python/${VERSION} &> /dev/null
	printf 'Running make\n'
	make -j 2 &> /dev/null
	#make test
	printf 'Running make install\n'
	make install &> /dev/null

	pushd /opt/python/${VERSION}/bin &> /dev/null
	printf 'Running pip install\n'
	if [[ $VERSION =~ ^2 ]]; then
		# FIXME there is no pip for python 2.7?
		#./pip install pytest tox virtualenv &> /dev/null
		printf 'FIXME - python2 does not seem to have pip\n'
	else
		./pip3 install pytest tox virtualenv &> /dev/null
	fi

	printf 'Symlinking binary to /usr/local/bin\n'
	ln -s /opt/python/${VERSION}/bin/python${MAJOR_MINOR} /usr/local/bin/python${MAJOR_MINOR}

	popd &> /dev/null
	popd &> /dev/null

	rm -rf ${DIR} ${FILE} ${SIG}
done
