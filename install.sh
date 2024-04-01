#!/usr/bin/env bash


pandamenu () {
    echo 'press 1 to nuke & pave brew'
    echo press 2 to install brew

    read -n 1 -p "Input Selection:" mainmenuinput
     if [ "$mainmenuinput" = "1" ]; then
        echo "nuke & pave brew"
        bash ./scripts/brew.sh --nuke
        
    elif [ "$mainmenuinput" = "2" ]; then
        echo "install brew"
        
        bash ./scripts/brew.sh
        
    else
        echo "You have entered an invallid selection!"
        echo "Please try again!"
        echo ""
        echo "Press any key to continue..."
        read -n 1
        clear
        pandamenu
    fi
}

pandamenu


