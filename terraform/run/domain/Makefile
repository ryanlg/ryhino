.PHONY: init plan apply output

PROFILE="bone"
TERRAFORM="terraform"
PLANOUT="tf.plan"

init:
	AWS_PROFILE=${PROFILE} ${TERRAFORM} init

plan:
	AWS_PROFILE=${PROFILE} ${TERRAFORM} plan -out ${PLANOUT}

apply:
	AWS_PROFILE=${PROFILE} ${TERRAFORM} apply ${PLANOUT}

output:
	AWS_PROFILE=${PROFILE} ${TERRAFORM} output
