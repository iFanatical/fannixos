{ ... }:

{
    programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;

	history = {
	    size = 100000;
	    save = 100000;
	    ignoreDups = true;
	    ignoreAllDups = true;
	    path = "${config.xdg.dataHome}/zsh/history";
	};

	shellAliases = {
	    poweroff = "systemctl poweroff";
	    reboot = "systemctl reboot";
	    suspend = "systemctl suspend";

	    # ls aliases
	    ls = "eza -alg --color=always --group-directories-first --icons";
	    la = "eza -ag --color=always --group-directories-first --icons";
	    ll = "eza -lg --color=always --group-directories-first --icons";
	    lt = "eza -aTg --color=always --group-directories-first --icons";
	    "l." = ''eza -ag | grep -E "^\\."'';
	    lD = "eza -D --color=always --group-directories-first --icons";
	    
	    cat = "bat --theme base16";
	    ogcat = "/bin/cat";
	    
	    ver = "cat /etc/os-release";
	    gpucheck = "$SCRIPTS/gpucheck.sh";
	    gpucrash = "sudo dmesg | grep -E '(amdgpu|drm|hang|reset|fence|timeout)' | tail -40";
	    
	    ".." = "z ..";
	    ".2" = "z ../..";
	    ".3" = "z ../../..";
	    ".4" = "z ../../../..";
	    ".5" = "z ../../../../..";
	    
	    clear = "\\clear; fastfetch";
	    ytdl = "yt-dlp -x -f bestaudio --audio-format mp3";
	    lsdisk = "sudo grc fdisk -l";
	    lsblk = "grc lsblk";
	    
	    tarnow = "tar -acf ";
	    untar = "tar -zxvf ";
	    wget = "wget -c ";
	    hw = "hwinfo --short";
	    
	    dir = "dir --color=auto";
	    vdir = "vdir --color=auto";
	    grep = "grep --color=auto";
	    fgrep = "fgrep --color=auto";
	    egrep = "egrep --color=auto";
	    
	    cp = "cp -i";
	    rmf = "rm -f --preserve-root";
	    
	    ip = "grc ip";
	    netstat = "grc ss -t";
	    ping = "grc ping";
	    bt = "btop";
	    
	    pvedcm1 = "ssh root@pvedcm1.bush.home.arpa";
	    proxmox02 = "ssh root@proxmox02.bush.home.arpa";
	    fanpbs = "ssh root@fanpbs.bush.home.arpa";
	    zabbix = "ssh fanatical@zabbix.bush.home.arpa";
	    wgserver = "ssh fanatical@wgdevuan.bush.home.arpa";
	    rartix = "ssh fanatical@rsync-artix.bush.home.arpa";
	    fileserver = "ssh fanatical@fileserver.bush.home.arpa";
	    mcserver = "ssh fanatical@minecraft-server.bush.home.arpa";
	    mcserverbeta = "ssh fanatical@10.1.30.14";
	    mcserverlatest = "ssh fanatical@minecraft-server-latest.bush.home.arpa";
	    pzserver = "ssh fanatical@pzserver.bush.home.arpa";
	    terserver = "ssh fanatical@terraria.bush.home.arpa";
	    thebois = "ssh fanatical@mcserver-thebois.bush.home.arpa";
	    smtpserver = "ssh fanatical@smtpserver.bush.home.arpa";
	    fanmedia = "ssh fanatical@fanmedia-arch.bush.home.arpa";
	    tsserver = "ssh fanatical@teamspeak.bush.home.arpa";
	    rustserver = "ssh fanatical@rustdesk.bush.home.arpa";
	    fan-fortigate = "ssh admin@fan-fortigate.bush.home.arpa";
	    cupsserver = "ssh fanatical@cups-server.bush.home.arpa";
	    jfserver = "ssh fanatical@jellyfin.bush.home.arpa";
	    startix = "ssh fanatical@startix.bush.home.arpa";
	    wgd = "ssh fanatical@wgdevuan.bush.home.arpa";
	    fanteks = "ssh fanatical@fanteks-artix.bush.home.arpa";
	    
	    nrebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
	    nupdate = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
	    ngc = "sudo nix-collect-garbage -d";
	    nsearch = "nix search nixpkgs";
	};

	initContent = ''
	    setopt autocd extendedglob nomatch correct_all
	    unsetopt beep notify
	    bindkey -e
	    
	    zstyle ':completion:*' menu select
	    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
	    zstyle ':completion:*' list-prompt '%F{red}...%f'
	    zstyle ':completion:*' select-prompt '%F{red}...%f'
	    
	    typeset -g -A key
	    key[Home]="''${terminfo[khome]}"
	    key[End]="''${terminfo[kend]}"
	    key[Insert]="''${terminfo[kich1]}"
	    key[Backspace]="''${terminfo[kbs]}"
	    key[Delete]="''${terminfo[kdch1]}"
	    key[Up]="''${terminfo[kcuu1]}"
	    key[Down]="''${terminfo[kcud1]}"
	    key[Left]="''${terminfo[kcub1]}"
	    key[Right]="''${terminfo[kcuf1]}"
	    key[PageUp]="''${terminfo[kpp]}"
	    key[PageDown]="''${terminfo[knp]}"
	    key[Shift-Tab]="''${terminfo[kcbt]}"
	    key[Control-Left]="''${terminfo[kLFT5]}"
	    key[Control-Right]="''${terminfo[kRIT5]}"
	    
	    [[ -n "''${key[Home]}"          ]] && bindkey -- "''${key[Home]}"          beginning-of-line
	    [[ -n "''${key[End]}"           ]] && bindkey -- "''${key[End]}"           end-of-line
	    [[ -n "''${key[Insert]}"        ]] && bindkey -- "''${key[Insert]}"        overwrite-mode
	    [[ -n "''${key[Backspace]}"     ]] && bindkey -- "''${key[Backspace]}"     backward-delete-char
	    [[ -n "''${key[Delete]}"        ]] && bindkey -- "''${key[Delete]}"        delete-char
	    [[ -n "''${key[Up]}"            ]] && bindkey -- "''${key[Up]}"            up-line-or-history
	    [[ -n "''${key[Down]}"          ]] && bindkey -- "''${key[Down]}"          down-line-or-history
	    [[ -n "''${key[Left]}"          ]] && bindkey -- "''${key[Left]}"          backward-char
	    [[ -n "''${key[Right]}"         ]] && bindkey -- "''${key[Right]}"         forward-char
	    [[ -n "''${key[PageUp]}"        ]] && bindkey -- "''${key[PageUp]}"        beginning-of-buffer-or-history
	    [[ -n "''${key[PageDown]}"      ]] && bindkey -- "''${key[PageDown]}"      end-of-buffer-or-history
	    [[ -n "''${key[Shift-Tab]}"     ]] && bindkey -- "''${key[Shift-Tab]}"     reverse-menu-complete
	    [[ -n "''${key[Control-Left]}"  ]] && bindkey -- "''${key[Control-Left]}"  backward-word
	    [[ -n "''${key[Control-Right]}" ]] && bindkey -- "''${key[Control-Right]}" forward-word
	    
	    if (( ''${+terminfo[smkx]} && ''${+terminfo[rmkx]} )); then
	      autoload -Uz add-zle-hook-widget
	      function zle_application_mode_start { echoti smkx }
	      function zle_application_mode_stop { echoti rmkx }
	      add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	      add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
	    fi
	    
	    function cd {
	      if [ "$1" = "-" ]; then
	        z -
	      else
	        z "$@" && pwd
	      fi
	    }
	    
	    function nv {
	      if [ $# -eq 0 ]; then
	        nvim .
	      else
	        nvim "$@"
	      fi
	    }
	    
	    function vim {
	      if [ $# -eq 0 ]; then
	        nvim .
	      else
	        nvim "$@"
	      fi
	    }
	    
	    precmd() { print -Pn "\e]0;%~\a" }
	    
	    fastfetch
	'';
	loginExtra = ''
	    if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
		startx
	    fi
	'';
    };

    programs.starship = {
	enable = true;
	enableZshIntegration = true;
	settings = builtins.fromTOML (builtins.readFile ./files/starship.toml);
    };

    home.sessionVariables = {
	SCRIPTS = "${config.home.homeDirectory}/.local/bin";
	editor = "nvim";
	VISUAL = "nvim";
	GTK_USE_PORTAL = "1";
	LS_COLORS = "di=01;34:fi=00;37:ln=01;36:bd=01;33:ex=01;32";
	WINEPREFIX = "${config.home.homeDirectory}/Games/wine";
	LC_COLLATE = "C";
    };
    
    home.sessionPath = [
	"${config.home.homeDirectory}/.local/bin"
    ];
}
