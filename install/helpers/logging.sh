# Logging system with live output streaming

# Start live log output display
start_log_output() {
  local ANSI_SAVE_CURSOR="\033[s"
  local ANSI_RESTORE_CURSOR="\033[u"
  local ANSI_CLEAR_LINE="\033[2K"
  local ANSI_HIDE_CURSOR="\033[?25l"
  local ANSI_RESET="\033[0m"
  local ANSI_GRAY="\033[90m"

  # Save cursor position and hide cursor
  printf $ANSI_SAVE_CURSOR
  printf $ANSI_HIDE_CURSOR

  (
    local log_lines=20
    local max_line_width=$((LOGO_WIDTH - 4))

    while true; do
      # Read the last N lines into an array
      mapfile -t current_lines < <(tail -n $log_lines "$MIMIRON_INSTALL_LOG_FILE" 2>/dev/null)

      # Build complete output buffer with escape sequences
      output=""
      for ((i = 0; i < log_lines; i++)); do
        line="${current_lines[i]:-}"

        # Truncate if needed
        if [ ${#line} -gt $max_line_width ]; then
          line="${line:0:$max_line_width}..."
        fi

        # Add clear line escape and formatted output for each line
        if [ -n "$line" ]; then
          output+="${ANSI_CLEAR_LINE}${ANSI_GRAY}${PADDING_LEFT_SPACES}  → ${line}${ANSI_RESET}\n"
        else
          output+="${ANSI_CLEAR_LINE}${PADDING_LEFT_SPACES}\n"
        fi
      done

      printf "${ANSI_RESTORE_CURSOR}%b" "$output"

      sleep 0.1
    done
  ) &
  monitor_pid=$!
}

# Stop live log output display
stop_log_output() {
  if [ -n "${monitor_pid:-}" ]; then
    kill $monitor_pid 2>/dev/null || true
    wait $monitor_pid 2>/dev/null || true
    unset monitor_pid
  fi
}

# Start installation logging
start_install_log() {
  sudo touch "$MIMIRON_INSTALL_LOG_FILE"
  sudo chmod 666 "$MIMIRON_INSTALL_LOG_FILE"

  export MIMIRON_START_TIME=$(date '+%Y-%m-%d %H:%M:%S')

  echo "=== Mimiron Installation Started: $MIMIRON_START_TIME ===" >>"$MIMIRON_INSTALL_LOG_FILE"
  start_log_output
}

# Stop installation logging and show summary
stop_install_log() {
  stop_log_output
  show_cursor

  if [[ -n ${MIMIRON_INSTALL_LOG_FILE:-} ]]; then
    MIMIRON_END_TIME=$(date '+%Y-%m-%d %H:%M:%S')
    echo "=== Mimiron Installation Completed: $MIMIRON_END_TIME ===" >>"$MIMIRON_INSTALL_LOG_FILE"
    echo "" >>"$MIMIRON_INSTALL_LOG_FILE"
    echo "=== Installation Time Summary ===" >>"$MIMIRON_INSTALL_LOG_FILE"

    if [ -n "$MIMIRON_START_TIME" ]; then
      MIMIRON_START_EPOCH=$(date -d "$MIMIRON_START_TIME" +%s)
      MIMIRON_END_EPOCH=$(date -d "$MIMIRON_END_TIME" +%s)
      MIMIRON_DURATION=$((MIMIRON_END_EPOCH - MIMIRON_START_EPOCH))

      MIMIRON_MINS=$((MIMIRON_DURATION / 60))
      MIMIRON_SECS=$((MIMIRON_DURATION % 60))

      echo "Total: ${MIMIRON_MINS}m ${MIMIRON_SECS}s" >>"$MIMIRON_INSTALL_LOG_FILE"

      # Export for use in finished.sh
      export MIMIRON_INSTALL_TIME="${MIMIRON_MINS}m ${MIMIRON_SECS}s"
    fi
    echo "=================================" >>"$MIMIRON_INSTALL_LOG_FILE"
  fi
}

# Run a script with logging
run_logged() {
  local script="$1"

  export CURRENT_SCRIPT="$script"

  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting: $script" >>"$MIMIRON_INSTALL_LOG_FILE"

  # Use bash -c to create a clean subshell
  bash -c "source '$script'" </dev/null >>"$MIMIRON_INSTALL_LOG_FILE" 2>&1

  local exit_code=$?

  if [ $exit_code -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Completed: $script" >>"$MIMIRON_INSTALL_LOG_FILE"
    unset CURRENT_SCRIPT
  else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Failed: $script (exit code: $exit_code)" >>"$MIMIRON_INSTALL_LOG_FILE"
  fi

  return $exit_code
}
