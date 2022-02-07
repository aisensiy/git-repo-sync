git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f target ${INPUT_TARGET_BRANCH}
        git push -f --tags target
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        break
        ;;
esac
