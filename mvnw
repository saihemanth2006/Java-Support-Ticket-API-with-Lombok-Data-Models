#!/bin/sh
set -e
BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
MAVEN_VERSION=3.9.9
MAVEN_HOME="$BASE_DIR/.mvn/wrapper/apache-maven-$MAVEN_VERSION"
MAVEN_BIN="$MAVEN_HOME/bin/mvn"
if command -v mvn >/dev/null 2>&1; then exec mvn "$@"; fi
if [ ! -x "$MAVEN_BIN" ]; then
  ARCHIVE="$BASE_DIR/.mvn/wrapper/apache-maven-$MAVEN_VERSION-bin.zip"
  URL="https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-$MAVEN_VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then curl -fsSL "$URL" -o "$ARCHIVE"; else wget -q "$URL" -O "$ARCHIVE"; fi
  unzip -q -o "$ARCHIVE" -d "$BASE_DIR/.mvn/wrapper"
  rm -f "$ARCHIVE"
fi
exec "$MAVEN_BIN" "$@"