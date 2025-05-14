function readConfirm --argument-names prompt
  set --local _prompt 'Do you want to continue? [y/N] '

  if not test -z $prompt
    set _prompt $prompt
  end

    while true
        read -l -P $_prompt confirm

        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end
