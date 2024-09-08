#!/bin/sh

firstCommand=$1
here=/home/kuro/work/commands
clinic360Route=/home/kuro/work/clinic360
back360Route=/home/kuro/work/back360

mainFlow() {
    if [[ -n "$firstCommand" ]]; then
        case $firstCommand in
        "help")
            echo "Hello fella! this is a script was maked to getting up Clinic360 the old or the new one"
            echo "this is a list of possibles commands:"
            echo ""
            echo "Without params this script will run with the back environment of test"
            echo ""
            echo "help  -- print this message"
            echo "-l    -- will run the local environtment of backend"
            echo "waos  -- waos"
            ;;
        "waos")
            echo "simplemente Waos!"
            ;;
        "-l")
            runBack
            runFront "Local"
            ;;
        *)
            echo "Command not found!"
            ;;
        esac
    else
        runFront "Test"
    fi
}

runFront() {
    cat $here/envs/to"$1"360.env >$clinic360Route/.env
    echo "Content of $here/envs/to"$1"360.env has been copied to $clinic360Route/.env"
    kitty -e bash -c "cd $clinic360Route && code . && npm run dev"
}

runBack() {
    kitty -e bash -c "cd $back360Route && docker compose -f docker-compose.andres.yml up -d"
}

cleanup() {
    echo "Ending the program..."
    kitty -e bash -c "cd $back360Route && docker compose -f docker-compose.andres.yml down"
}

mainFlow
trap cleanup EXIT