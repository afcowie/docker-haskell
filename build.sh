docker run --rm=true localhost/afcowie/debian:stretch cat /.stamp > .base
touch -d`cat .base` .base
if [ .base -nt .stamp ] ; then
	date -u +%FT%TZ > .stamp
fi

docker build \
	--tag=localhost/afcowie/haskell:lts-12.18 \
	--network=proxy \
	--force-rm=true \
	--tmpfs=/tmp \
	--tmpfs=/.stack-work \
	.
