# vscode: give every project window of VS Code a color of its own
#
# `code <dir>` (exactly one argument, an existing directory) opens the
# folder as usual. Unless the folder's .vscode/settings.json sets colors
# already, the title bar and the status bar first get the next color of a
# muted palette, so every project keeps a color of its own:
#  - A missing or empty settings.json is written anew. In a git work tree
#    it is also listed in .git/info/exclude, so it is never committed.
#  - Into a settings.json with settings (it may be committed), the colors
#    are inserted after its first line `{`, between two marker comments.
#    In a git work tree a local filter (.git/info/attributes and the
#    repository's config) drops the marked lines whenever git reads the
#    file, so they never show up in git status, a diff or a commit.
#    To remove the colors, delete the marked lines.
#
# Other extensions that manage these colors (e.g. Peacock) may remove
# them again; use one or the other.
#
# Any other use of `code` is passed through unchanged. To open a folder
# without giving it a color, run `command code <dir>`.

if (( $+commands[code] )); then
    function code() {
        if (( $# == 1 )) && [[ -d $1 ]]; then
            __code_color ${1:A}
        fi
        command code "$@"
    }

    # Give folder $1 the next palette color unless its settings set colors
    # already; the index of the next color is kept in a state file.
    function __code_color() {
        local dir=$1 settings=$1/.vscode/settings.json content=
        [[ -w $dir && ! -L $settings ]] || return
        if [[ -e $settings ]]; then
            content=$(command cat -- $settings && print -n .) || return
            content=${content%.}
            [[ $content == *workbench.colorCustomizations* ]] && return
        fi

        local in_git=0 tracked=0 new=0
        if (( $+commands[git] )) && git -C $dir rev-parse --is-inside-work-tree &> /dev/null; then
            in_git=1
            git -C $dir ls-files --error-unmatch -- .vscode/settings.json &> /dev/null && tracked=1
        fi
        local bare=${content//[[:space:]]/}
        if [[ -z $bare || $bare == '{}' ]] && (( ! tracked )); then
            new=1
        elif [[ $content != *$'\n'* || ${${content%%$'\n'*}//[[:space:]]/} != '{' ]]; then
            return    # no first line `{` to insert the colors after
        fi

        local -a palette=('#374b62' '#624737' '#376247' '#623759'
                          '#625537' '#375962' '#62373d' '#526237'
                          '#473762' '#37625c' '#5c3762' '#373d62')
        local state=${XDG_STATE_HOME:-$HOME/.local/state}/vscode-color
        [[ $state == /* ]] || state=$HOME/.local/state/vscode-color
        local next=0
        [[ -r $state/next ]] && next=$(<$state/next)
        [[ $next == <-> ]] || next=0
        local color=${palette[$(( next % ${#palette} + 1 ))]}

        # keep the colors out of git (paths relative to the root of the work tree)
        local unchanged=0
        if (( in_git )); then
            local entry=/$(git -C $dir rev-parse --show-prefix).vscode/settings.json list=exclude
            if (( ! new )); then
                [[ $entry == *[[:space:]]* ]] && return    # not a valid attributes pattern
                git -C $dir config filter.vscode-color.clean \
                    "sed -e '/vscode-color: begin/,/vscode-color: end/d'" || return
                entry+=' filter=vscode-color' list=attributes
            fi
            local file=$(git -C $dir rev-parse --git-path info/$list)
            [[ $file == /* ]] || file=$dir/$file
            command mkdir -p -- ${file:h}
            command grep -qxF -- $entry $file 2> /dev/null || print -r -- $entry >> $file
            (( tracked )) && git -C $dir diff --quiet -- .vscode/settings.json 2> /dev/null && unchanged=1
        fi

        local colors="\"workbench.colorCustomizations\": {
    \"titleBar.activeBackground\": \"$color\",
    \"titleBar.activeForeground\": \"#e6e6e6\",
    \"titleBar.inactiveBackground\": \"${color}b3\",
    \"titleBar.inactiveForeground\": \"#e6e6e6b3\",
    \"statusBar.background\": \"$color\",
    \"statusBar.foreground\": \"#e6e6e6\"
  }"
        command mkdir -p -- $dir/.vscode || return
        if (( new )); then
            print -r -- "{
  $colors
}" >| $settings.tmp
        else
            print -rn -- "${content%%$'\n'*}
  // vscode-color: begin (colors of this window only; git does not see these lines)
  $colors,
  // vscode-color: end
${content#*$'\n'}" >| $settings.tmp
        fi || return
        command mv -f -- $settings.tmp $settings || return
        command mkdir -p -- $state && print -r -- $(( next + 1 )) >| $state/next

        # git takes a committed file whose size has changed for modified
        # without filtering it; adding the file again, which stages nothing,
        # records the new size (unless it had changes of its own)
        if (( unchanged )); then
            git -C $dir add -- .vscode/settings.json &> /dev/null
        fi
    }
fi
