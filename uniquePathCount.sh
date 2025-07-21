# Mix of diff cmds
# grep "Started" tmp_more_than_50 | awk '{print $3}' | cut -d'?' -f1 | sort | uniq -c | sort -nr

# Just awk cmd more optimal
awk '/Started/ { split($3, a, "?"); print a[1] }' tmp_more_than_50 | sort | uniq -c | sort -nr


