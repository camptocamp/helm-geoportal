HELM != helm

gen-expected:
	${HELM} template --namespace=default --values=tests/version.yaml test . > tests/expected.yaml || \
		${HELM} template --debug --namespace=default --values=tests/version.yaml test
	sed -i 's/[[:blank:]]\+$$//g'  tests/expected.yaml
	${HELM} template --namespace=default --values=tests/version.yaml --values=tests/full.yaml test . > tests/full-expected.yaml || \
		${HELM} template --debug --namespace=default --values=tests/version.yaml --values=tests/full.yaml test
	sed -i 's/[[:blank:]]\+$$//g'  tests/full-expected.yaml
