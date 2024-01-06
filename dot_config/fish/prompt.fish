#!/usr/bin/env fish
# https://github.com/IlanCosman/tide/wiki/Configuration

# Prompts
set -U tide_left_prompt_frame_enabled false
set -U tide_left_prompt_items context pwd git newline jobs private_mode character
set -U tide_left_prompt_prefix

set -U tide_prompt_add_newline_before true
set -U tide_prompt_color_frame_and_connection brblack
set -U tide_prompt_color_separator_same_color brblack
set -U tide_prompt_icon_connection ' '
set -U tide_prompt_pad_items false

set -U tide_pwd_markers .git .gitignore .github .azuredevops .tool-versions .terraform Cargo.toml go.mod package.json Taskfile.yaml

set -U tide_right_prompt_frame_enabled false
set -U tide_right_prompt_items aws cmd_duration go java node python ruby rustc shlvl terraform kubectl

# Item configuration
set -U tide_aws_bg_color normal
set -U tide_aws_color yellow
set -U tide_aws_icon ' '

set -U tide_character_color brgreen
set -U tide_character_color_failure brred
set -U tide_character_icon '❯'
set -U tide_character_vi_icon_default '❮'
set -U tide_character_vi_icon_replace '▶'
set -U tide_character_vi_icon_visual V

set -U tide_cmd_duration_bg_color normal
set -U tide_cmd_duration_color brblack
set -U tide_cmd_duration_icon ''
set -U tide_cmd_duration_threshold 5000

set -U tide_context_bg_color normal
set -U tide_context_color_default yellow
set -U tide_context_color_root bryellow
set -U tide_context_color_ssh yellow
set -U tide_context_hostname_parts 1

set -U tide_direnv_bg_color normal
set -U tide_direnv_bg_color_denied normal
set -U tide_direnv_color bryellow
set -U tide_direnv_color_denied brred
set -U tide_direnv_icon ' ▼'

set -U tide_gcloud_bg_color normal
set -U tide_gcloud_color blue
set -U tide_gcloud_icon ' 󰊭'

set -U tide_git_bg_color normal
set -U tide_git_bg_color_unstable normal
set -U tide_git_bg_color_urgent normal
set -U tide_git_color_branch brgreen
set -U tide_git_color_conflicted brred
set -U tide_git_color_dirty bryellow
set -U tide_git_color_operation brred
set -U tide_git_color_staged bryellow
set -U tide_git_color_stash brgreen
set -U tide_git_color_untracked brblue
set -U tide_git_color_upstream brgreen
set -U tide_git_icon ' '

set -U tide_go_bg_color normal
set -U tide_go_color brcyan
set -U tide_go_icon ' '

set -U tide_java_bg_color normal
set -U tide_java_color yellow
set -U tide_java_icon ' '

set -U tide_jobs_bg_color normal
set -U tide_jobs_color blue
set -U tide_jobs_icon '󰫢'
set -U tide_jobs_number_threshold 2

set -U tide_kubectl_bg_color normal
set -U tide_kubectl_color blue
set -U tide_kubectl_icon ' 󱃾'

set -U tide_node_bg_color normal
set -U tide_node_color green
set -U tide_node_icon ' '

set -U tide_private_mode_bg_color normal
set -U tide_private_mode_color brwhite
set -U tide_private_mode_icon '󰗹'

set -U tide_pwd_bg_color normal
set -U tide_pwd_color_anchors brcyan
set -U tide_pwd_color_dirs cyan
set -U tide_pwd_color_truncated_dirs magenta
set -U tide_pwd_icon
set -U tide_pwd_icon_unwritable ''

set -U tide_python_bg_color normal
set -U tide_python_color cyan
set -U tide_python_icon ' 󰌠'

set -U tide_ruby_bg_color normal
set -U tide_ruby_color red
set -U tide_ruby_icon ' '

set -U tide_rustc_bg_color normal
set -U tide_rustc_color red
set -U tide_rustc_icon ' '

set -U tide_shlvl_bg_color normal
set -U tide_shlvl_color yellow
set -U tide_shlvl_icon ' '
set -U tide_shlvl_threshold 1

set -U tide_status_bg_color normal
set -U tide_status_bg_color_failure normal
set -U tide_status_color green
set -U tide_status_color_failure red
set -U tide_status_icon ' ✔'
set -U tide_status_icon_failure ' ✘'

set -U tide_terraform_bg_color normal
set -U tide_terraform_color magenta
set -U tide_terraform_icon ' 󱁢'

# vim:ft=fish
