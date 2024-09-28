# MySQL
set -gx PATH /usr/local/mysql/bin $PATH
set -gx MSQL "mysql://root:123@localhost/"
set -gx LDFLAGS "-L/opt/homebrew/opt/mysql@8.0/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/mysql@8.0/include"
set -gx EDITOR nvim
function msql
    set -l arg1 $argv[1]
    switch $arg1
        case -s
            brew services start mysql@8.0
        case -q
            brew services stop mysql@8.0
        case -r
            brew services restart mysql@8.0
        case '*'
            if test (count $argv) -ge 1
                set -l username $argv[1]
                echo "Connecting to MySQL as '$username'..."
                mysql -u $username -p
            else
                echo "Usage: msql [-s | -q | -r] <username>"
            end
    end
end
