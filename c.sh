# syntax
# c port [http_method]

c(){
    if [[ ! $2 ]]
    then
        curl http://localhost:$1
    else
        http_method=$1
        # U is specially for zsh  
        curl -X ${(U)http_method} http://localhost:$2
    fi
}