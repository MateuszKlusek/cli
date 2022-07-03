cc(){
    arr=("tsx" "typescript" "ts")
    if [ "$#" -ne  1 ]; then
            extention=jsx
            if [[ " ${arr[*]} " =~ " $2 " ]]; then
                    extention=tsx
            fi
    else
            extention=jsx
    fi
    mkdir $1
    cd $1
    touch "$1.$extention"
    cat > "$1.$extention" << EOF
    const $1 = () => {
return <div></div>;
};
export default $1;
EOF

        touch "$1.styled.$extention"
        cat > "$1.styled.$extention" << OEF
import styled from "styled-components"
OEF
        touch "$1.test.$extention"
        cat > "$1.test.$extention" << OEF
import {render, screen} from '@testing-library/react';
import '@testing-library/jest-dom'2
// component
import $1 from "./$1"5
test.todo('add tests');
OEF
}