set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"

#Turn on mouse
set -g mouse on


#set prfix key to M+Space
unbind C-b
set -g prefix M-.
bind M-. send-prefix

#switch btween windows using Alt+< or Alt+>
bind -n M-< previous-window
bind -n M-> next-window


# Use Alt-arrow keys without prefix key to switch panes
bind -n M-l select-pane -L
bind -n M-L select-pane -R
bind -n M-k select-pane -D
bind -n M-K select-pane -U

#Create split
bind -n M-/ split-window -v -c "#{pane_current_path}"
bind -n M-? split-window -h -c "#{pane_current_path}"

#kill a pane or window
#bind -n M-x kill-pane

set-option -g status-position bottom
set -g status-style 'bg=#1e1e2e'

#copy 
set-option -g set-clipboard on
#setw -g mode-keys vi
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "wl-copy"

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin "mark-pitblado/catppuccin-tmux"

#Automatic restoring and continuous saving
set -g @plugin 'tmux-plugins/tmux-resurrect'
	#prefix + Ctrl-s - save
	#prefix + Ctrl-r - restore

set -g @catppuccin-tmux_show_git 0
set -g @catppuccin-tmux_pane_id_style hide 
set -g @catppuccin-tmux_zoom_id_style hide 
set -g @catppuccin-tmux_show_path 1
#set -g @catppuccin-tmux_theme 'frappe'

bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
run '~/.config/tmux/plugins/tpm/tpm'
