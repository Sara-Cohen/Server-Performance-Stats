
# Function to get Total CPU Usage
get_cpu_usage() {
  # Using 'top' command to get CPU usage (excluding the first line of headers)
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  echo "Total CPU Usage: $cpu_usage%"
}
# Function to get Total memory usage (Free vs Used including percentage)
get_memory_usage(){
# Using 'top' command to get MEM usage (excluding the first line of headers)
  memory_stats=$(free -m | awk 'NR==2{printf "Total Memory: %s MB\nUsed Memory: %s MB\nFree Memory: %s MB\nMemory Usage: %.2f%\n", $2, $3, $4, ($3/$2)*100}')
  echo "$memory_stats"
}
# Function to get Total disk usage (Free vs Used including percentage)
get_disk_usage() {
  disk_stats=$(df -h --total | grep "total" | awk '{printf "Total Disk Space: %s\nUsed Disk Space: %s\nFree Disk Space: %s\nDisk Usage: %.2f%\n", $2, $3, $4, ($3/$2)*100}')
  echo "$disk_stats"
}
# Function to get Top 5 processes by CPU usage
get_top_cpu_processes() {
  echo "Top 5 Processes by CPU Usage:"
  ps aux --sort=-%cpu | head -n 6 | tail -n 5
}
# Function to get Top 5 processes by memory usage
get_top_memory_processes() {
  echo "Top 5 Processes by Memory Usage:"
  ps aux --sort=-%mem | head -n 6 | tail -n 5
}

get_cpu_usage
get_memory_usage
get_disk_usage
get_top_cpu_processes
get_top_memory_processes
