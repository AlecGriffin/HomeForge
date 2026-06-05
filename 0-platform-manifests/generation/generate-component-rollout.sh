
export CONFILE_FILE_PATH="./configs/component-rolllout-config.cue"
export COMPONENT_ROLLOUT_KUSTOMIZATION_PATH="../platform/component-rollout/"

cue export $CONFILE_FILE_PATH --out yaml | yq '.kustomizations[]'  -s 'strenv(COMPONENT_ROLLOUT_KUSTOMIZATION_PATH) + .metadata.name + ".yaml"'
cue export $CONFILE_FILE_PATH --out yaml | yq '.kustomize' > "${COMPONENT_ROLLOUT_KUSTOMIZATION_PATH}/kustomization.yaml"