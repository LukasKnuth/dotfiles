# Should be used in a pipe with arbitrary input in tabular format.
# Example: `docker images | pick_table`
# Will return one or mulitple values from the specified column.
function pick_table
    argparse h/header= c/column= -- $argv
    or return

    # Accept header if specified
    set -l args --multi
    if set -q _flag_column
        set -a args --accept-nth $_flag_column
    end
    if set -q _flag_header
        set -a args --header-lines $_flag_header
    end

    # Read full stdin
    set -l table
    while read -l row
        set -a table $row
    end

    # Call command finally
    printf "%s\n" $table | fzf $args
end
