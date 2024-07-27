function swe() {
  export AWS_PROFILE=$1
  aws eks update-kubeconfig --name "$(aws eks list-clusters | jq -r ".clusters[0]")"

  err_code=$?

  if [ $err_code -ne 0 ]; then
    echo "Try login with your profile $1"
    aws sso login --profile "$1"
    err_code=$?
    if [ "$err_code" -eq 0 ]; then
      echo "Login success"
      swe "$1"
      return 1
    else
      echo "Login failed"
      return 1
    fi
  fi
}
