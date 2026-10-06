#!/usr/bin/env bash
set -euo pipefail
grep -R --include='*.java' -q '@Value' src/main/java
grep -R --include='*.java' -q '@Builder' src/main/java
grep -R --include='*.java' -q '@RequiredArgsConstructor' src/main/java
if grep -R --include='*.java' -q '@Autowired' src/main/java; then exit 1; fi
if grep -R --include='*.java' -E -q 'public (void )?set[A-Z]|public [^ ]+ get[A-Z]' src/main/java; then exit 1; fi
echo 'Lombok verification passed.'