function weztermUpdateWslConfigs --argument-names filenameglob
    set --local sourceBasePath /home/maxx/dotfiles/wezterm/
    set --local targetBasePath ~/WinHome/.config/wezterm/
    set --local prompt "Do you wish to update"

    function _execute --no-scope-shadowing --argument-names filearg
        set --local truncated (string replace $sourceBasePath "" $filearg)

        if readConfirm "$prompt <$truncated>? [y/N] "
            if test -d $filearg
                rm -r "$targetBasePath$truncated"
                cp -r $filearg $targetBasePath
            else
                rm "$targetBasePath$truncated"
                cp $filearg $targetBasePath
            end
        end
    end

    if not functions -q readConfirm
        echo "no <readConfirm> function"
        return 1
    end

    if test -z $filenameglob
        for file in $sourceBasePath/*
            _execute $file
        end
    else
        set --local findResult (find $sourceBasePath -maxdepth 1 -name "*$filenameglob*")
        set --local countFindResult (count $findResult)

        if test $countFindResult -gt 1
            echo $findResult
        else if test $countFindResult -eq 1
            _execute $findResult
        else
            echo "nothing found"
        end
    end
end
