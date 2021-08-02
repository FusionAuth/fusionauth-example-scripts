
docker pull fusionauth/fusionauth-app


if [ "x$1" = "x" ]; then
  echo "Must provide unique id which is good for dirname"
  exit 1
fi

UNIQID=$1

FA_VERSION=latest
if [ "x$2" != "x" ]; then
  FA_VERSION=$2
fi

echo "using $FA_VERSION"

cp -pr template $UNIQID

for i in $UNIQID/*.yml; do
  sed 's/XXX/'$UNIQID'/g' $i > $i.bak ; mv $i.bak $i
  sed 's/YYY/'$FA_VERSION'/g' $i > $i.bak ; mv $i.bak $i
done


