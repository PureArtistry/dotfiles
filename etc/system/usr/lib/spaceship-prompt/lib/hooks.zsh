# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# TODO: Let sections register their own hooks via `spaceship::register_hook`

# Execution time start
spaceship_exec_time_preexec_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_smaller_units ]] && unset SPACESHIP_EXEC_TIME_smaller_units
  SPACESHIP_EXEC_TIME_start=$(date +'%s %N')
}

# Execution time end
spaceship_exec_time_precmd_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return
  local SPACESHIP_EXEC_TIME_stop=$(date +'%s %N')
  local SPACESHIP_EXEC_TIME_start_SU_test=$(echo "$SPACESHIP_EXEC_TIME_start" | cut -f 1 -d " ")
  local SPACESHIP_EXEC_TIME_stop_SU_test=$(echo "$SPACESHIP_EXEC_TIME_stop" | cut -f 1 -d " ")
  SPACESHIP_EXEC_TIME_smaller_units=$(( $SPACESHIP_EXEC_TIME_stop_SU_test - $SPACESHIP_EXEC_TIME_start_SU_test ))
  if [[ $SPACESHIP_EXEC_TIME_smaller_units -lt 1 ]]; then
    SPACESHIP_EXEC_TIME_start_SU_test=${SPACESHIP_EXEC_TIME_start##* }
    SPACESHIP_EXEC_TIME_stop_SU_test=${SPACESHIP_EXEC_TIME_stop##* }
    SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_stop_SU_test - $SPACESHIP_EXEC_TIME_start_SU_test ))
    SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_duration / 1000 ))
    SPACESHIP_EXEC_TIME_smaller_units=true
  elif [[ $SPACESHIP_EXEC_TIME_smaller_units == 1 ]]; then
    SPACESHIP_EXEC_TIME_start_SU_test=${SPACESHIP_EXEC_TIME_start##* }
    SPACESHIP_EXEC_TIME_stop_SU_test=${SPACESHIP_EXEC_TIME_stop##* }
    SPACESHIP_EXEC_TIME_duration=$(( 1000000000 - $SPACESHIP_EXEC_TIME_start_SU_test ))
    SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_duration + $SPACESHIP_EXEC_TIME_stop_SU_test ))
    SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_duration / 1000 ))
    SPACESHIP_EXEC_TIME_smaller_units=true
  else
    SPACESHIP_EXEC_TIME_duration="$SPACESHIP_EXEC_TIME_smaller_units"
    SPACESHIP_EXEC_TIME_smaller_units=false
  fi
  unset SPACESHIP_EXEC_TIME_start
}

# vcs_info hook
spaceship_exec_vcs_info_precmd_hook() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return
  vcs_info
}
