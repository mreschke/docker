#$path will be set as path to docker-compose.yml file
function compose() {

    if [ "$1" == 'up'  ] || [ "$1" == 'down' ]; then
        echo "NOTICE: You probably wanted 'start' or 'stop' not up/down"
        echo -n "Are you sure you want the '$1' command (y/N)? "; read answer
        if [ "$answer" != "${answer#[Yy]}" ] ;then
            # Using Yy preserves NO as default if you press enter or any other characters
            echo "Continuing"
        else
            echo "Ignoring '$1' command"
            exit 1
        fi
    fi

    cd $path
    docker-compose "$@"
}


