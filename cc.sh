cc(){
    # syntax -> cc component_name [tsx|typescript|ts]

    # posible arguments (other arguments will be ommited)
    arr=("tsx" "typescript" "ts")
    # default extension
    extention=jsx
    if [ "$#" -ne  1 ]; then
            # if arguments in arr, we have a tsx files
            if [[ " ${arr[*]} " =~ " $2 " ]]; then
                    extention=tsx
            fi
    fi
    mkdir $1
    cd $1

    # create a component file with a proper extention and populate file with content
    touch "$1.$extention"
    cat > "$1.$extention" << EOF
        const $1 = () => {
    return <div></div>;
    };
    export default $1;
EOF

    # create styles component files 
    touch "$1.styled.$extention"
    cat > "$1.styled.$extention" << OEF
    import styled from "styled-components"
OEF

    # creating style file with default todo test
    touch "$1.test.$extention"
    cat > "$1.test.$extention" << OEF
    import {render, screen} from '@testing-library/react';
    import '@testing-library/jest-dom'2
    // component
    import $1 from "./$1"5
    test.todo('add tests');
OEF

}