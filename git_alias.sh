#!/usr/bin/env bash
git --version
op="add git aliases"
if [[ $? -eq 0 ]]; then 
    git config --global alias.cf config # конфигуратор
    git cf --global alias.st status # текущее состояние репозитария
    git cf --global alias.ci commit # подтверждение изменений в локальном репозитарии
    git cf --global alias.co checkout # переключение на ветку
    git cf --global alias.ad add # добавление 
    git cf --global alias.tg tag # тэг
    git cf --global alias.df diff 
    git cf --global alias.pul pull # получить в удаленный репозитарий
    git cf --global alias.psh push # отправить изменения в удаленный репозитарий
    git cf --global alias.lg log # показать лог комитов
    git cf --global alias.hp help # получить справку
    echo "OK: did $op, see: https://romanvbabenko.blogspot.com/2008/09/git.html"
else 
    echo "ERR: failed to $op: git is not found"
fi
