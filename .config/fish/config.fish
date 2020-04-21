set PATH $PATH:/var/lib/snapd:/snap/bin:/snap/bin:/opt/lampp:(yarn global bin):/home/damiani/.gem/ruby/2.7.0/bin

function vi
    command nvim $argv
end
function vim
    command nvim $argv
end

function more
    command less $argv
end

function pacup
    command sudo pacman -Syu
     yay -Syu
end
function paclean
    set packages (pacman -Qdtq)
    if test -n "$packages"
        sudo pacman -Rcns $packages
    else
        echo "No packages to clean"
    end
end
function waka-waka
    pacup
    command printf "\n"
    paclean
end

function rm
    command trash-put $argv
end
function list
    command trash-list
end
function empty
    command trash-empty
end
function restore
    command trash-restore
end

# Vim alias
function q
    exit
end

# Check temp
# function cpu
#     command CPU0_TEMP=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq) \
#         CPU1_TEMP=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq) \
#         CPU2_TEMP=$(cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq) \
#         CPU3_TEMP=$(cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq) \

#         CPU_TEMP=$(((CPU0_TEMP + CPU1_TEMP + CPU2_TEMP + CPU3_TEMP) / 4)) && printf "%.2fGHz\n" $((CPU_TEMP / 1000000.0))
# end

# Download only AUR packages using yay
function yay
    command yay $argv --aur 
end

# xampp control panel
function xampp
    command sudo /opt/lampp/manager-linux-x64.run
end

# dot-config git repository alias
function dot-config
    command git --git-dir=$HOME/dot-config --work-tree=$HOME $argv
end

# clean fetch screen
function ufetch
    command clear
    command ufetch
end
function neofetch
    command clear
    command neofetch
end
