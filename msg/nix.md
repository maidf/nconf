## 启用wsl
```
wsl --install --no-distribution
```

### 下载内核包 一般不用下，arch的包里有  
[wsl_update_x64.msi](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)


### 设置默认版本，较新系统一般默认已经是wsl2  
```
wsl --set-default-version 2
wsl --update
```

## 设置.wslconfig
```.wslconfig
# Settings apply across all Linux distros running on WSL 2
[wsl2]

# Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB
memory=4GB

# Sets the VM to use two virtual processors
processors=2

# Sets amount of swap storage space to 8GB, default is 25% of available RAM
swap=2GB

# Turn on default connection to bind WSL 2 localhost to Windows localhost
# localhostforwarding=true

ipv6=true
# mirrored模式可能会导致win无法识别wsl转发的端口，但是不用mirrored模式就没法代理，然后就可能没法连到github什么的
networkingMode=mirrored
# dnsTunneling=true
firewall=false
# net模式不支持代理，这里好像没用
# autoProxy=true
defaultVhdSize=137438953472

[experimental]
autoMemoryReclaim=gradual
bestEffortDnsParsing=true
# useWindowsDnsCache=true
```

## 安装nixos的wsl包
https://github.com/nix-community/NixOS-WSL/releases

## 安装改名字
```
wsl --export NixOS nix_bak.tar
wsl --import MaidNix .\ .\nix_bak.tar --version 2
```

## 设置默认wsl
```
wsl -s MaidNix
```

## 更新
```bash
sudo nix-channel --add https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-24.11/nixexprs.tar.xz nixos
sudo nix-channel --add https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable/nixexprs.tar.xz nixpkgs
# 必须update一次
sudo nix-channel --update

sudo nano /etc/nixos/configuration.nix
sudo nixos-rebuild switch --option substituters "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
```

### configuration.nix
```configuration.nix
{ config, lib, pkgs, ... }:
let
    usr = "maidf";
    syshost = "mlnix";
in
{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl = {
    enable = true;
    defaultUser = "${usr}";
    wslConf = {
      user.default = "${usr}";
      network = {
        hostname = "${syshost}";
        generateHosts = false;
      };
    };
    useWindowsDriver = true;
  };

  nix.settings = {
    trusted-users = [ ${usr} ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  system.stateVersion = "24.11";
}
```

### 设置ssh
```
ssh-keygen -t ed25519 -C "ml@fufu.moe"
```

添加到ssh-agent, 可以不弄这个，代理转发需要
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

测试是否有效
```
ssh -T git@github.com
```


## 复制flake项目
```bash
nix shell nixpkgs#git
git clone https://github.com/maidf/nconf.git
```



## 关闭wsl
```
wsl --shutdown
```
