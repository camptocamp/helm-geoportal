HELM != helm

gen-expected:
	${HELM} template --namespace=default --values=tests/version.yaml test . > tests/expected.yaml
	sed -i 's/[[:blank:]]\+$$//g'  tests/expected.yaml
	${HELM} template --namespace=default --values=tests/version.yaml --values=tests/full.yaml test . > tests/full-expected.yaml
	sed -i 's/[[:blank:]]\+$$//g'  tests/full-expected.yaml
