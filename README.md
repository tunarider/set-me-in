# Set Me In

환경 구성용.
여러 환경을 바꿔가면서 사용하거나 여러 장비끼리 설정 동기화할때 사용한다.

iCloud 디렉토리 같은 곳에 넣어두고 쓰면 된다.

## 준비물

### Ansible

Ansible을 사용한다.
주로 `blockinfile`로 설정파일 내에 해당 환경에서 필요한 값들을 넣어준다.

#### 설치

```
brew install ansible
```

## 사용 방법

### `smi` 명령어 및 자동완성 설정

`./bin/zsh.sh`를 로드하면 `smi` 명령어 및 자동완성을 사용할 수 있다.

```
# $HOME/.zshrc

source $SMI_DIR/bin/zsh.sh
```

### 환경 추가

1. `./context` 디렉토리 아래에 각 환경별 설정파일을 넣어준다.
2. `smi {enable,apply} $directory_name`으로 환경울 구성한다.
3. 와우 굳굳

### enable 항목 적용시

여러번 적용할 필요 없이 한 번 적용하면 되는 애들은 이걸로 설정할 수 있다.

- aws_config
- gpg_key
- hosts
- pgpass
- saml2aws
- ssh_config
- ssh_key

```
smi enable example
```

### apply 항목 적용시

여러 환경을 번갈아가면서 사용하는 경우 `apply`를 사용한다.

- git config
- ssh key(id_rsa)

```
smi apply example
```
