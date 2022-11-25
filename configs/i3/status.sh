# [General]
SYMBOL="ꞏ"
HOSTNAME="Leslie"

# [Date]
DATE_CURRENT=$(date +"%H:%M ${SYMBOL} %Y-%m-%d" )
DATE_MESSAGE="${DATE_CURRENT}"

# [Battery]
BATTERY_LIFE=$(sysctl hw.acpi.battery.life | cut -d " " -f 2)
BATTERY_MESSAGE="${BATTERY_LIFE}%"

# [CPU]
#CURRENT_CPU_USAGE=$(top -d 2 | grep "CPU\:" | awk '{print 100-$10}' | tail -n 1)
#CPU_MESSAGE="$(echo ${CURRENT_CPU_USAGE} | cut -d "." -f 1)%"

# [Memory]
#MEMORY_USAGE=$(zfs-stats -M | grep "Logical Used" | awk '{print $3}' | cut -d "%" -f 1 | awk '{print int($1+0.5)}')
#MEMORY_MESSAGE="${MEMORY_USAGE}%"

# [Output]
#MESSAGE="${SYMBOL} ${CPU_MESSAGE} ${SYMBOL}"
#MESSAGE="${MESSAGE} ${MEMORY_MESSAGE} ${SYMBOL}"
MESSAGE="${MESSAGE} ${BATTERY_MESSAGE} ${SYMBOL}"
MESSAGE="${MESSAGE} ${DATE_MESSAGE} ${SYMBOL}"
MESSAGE="${MESSAGE} ${HOSTNAME} ${SYMBOL}  "
echo "${MESSAGE}"
