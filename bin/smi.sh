#!/bin/zsh

BASEDIR=$(dirname "$0")

CMD_NAME=smi

_comp-$CMD_NAME() {
    local state

    _arguments \
        '1: :->action' \
        '2: :->context' \
        '3: :->file'

    case $state in
        action)
            compadd "$@" 'apply' 'enable' 'edit' 'cat' ;;
        context)
            compadd "$@" $(ls $BASEDIR/../context) ;;
        file)
            if [ "$words[2]" = 'edit' ] || [ "$words[2]" = 'cat' ]; then
                compadd "$@" $(ls -p $BASEDIR/../context/$words[3] | grep -v /)
            fi
        ;;
    esac
}

$CMD_NAME() {
    case $1 in
        apply)
            ansible-playbook $BASEDIR/../apply.yml --extra-vars "smi_context='$2'" -i localhost,
            ;;
        enable)
            ansible-playbook $BASEDIR/../enable.yml --extra-vars "smi_context='$2'" -K -i localhost,
            ;;
        cat)
            if [ $# -eq 3 ]; then
                rougify $BASEDIR/../context/$2/$3
            else
                echo "need more params"
            fi
            ;;
        edit)
            if [ $# -eq 3 ]; then
                ew $BASEDIR/../context/$2/$3
            else
                echo "need more params"
            fi
            ;;
        *)
            echo "need more params"
            ;;
    esac
}

compdef _comp-$CMD_NAME $CMD_NAME
