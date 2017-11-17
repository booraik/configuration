
Auto config in OS
=================

OS 설치 --> 패키지 설치 --> 환경설정 무한 반복
지겹다 맨날 똑같은 작업
자동화 할 수 있는부분은 최대한 자동화를 진행해보자.

목표
----
default_os_conf.sh 실행 한번으로 기본 설정 가능
단일 설정 변경은 각 설정파일 참조

*curl*
> sh -c "$(curl -fsSL https://github.com/booraik/configuration/blob/master/default_os_conf.sh)"

*wget*
> sh -c "$(wget https://github.com/booraik/configuration/blob/master/default_os_conf.sh -0 -)"

* * *

1. profile
2. vimrc
3. zshrc
4. tmux.conf
