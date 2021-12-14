# SSH Agent forwarding to solve problems with devcontainer in WSL2
# https://github.com/microsoft/vscode-remote-release/issues/2925
if [ -z "$SSH_AUTH_SOCK" ]; then
    # Check for a currently running instance of the agent
    RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
    if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> .ssh/ssh-agent
    fi
    eval `cat .ssh/ssh-agent`
fi

eval $(keychain --eval --agents ssh id_rsa)
