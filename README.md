# Удаление ненужных коммитов
Придумать как можно удалить все коммиты из истории кроме трех последних


# Expected result:
- Публичный репозиторий
- Склоненный с репозитория https://github.com/MaksymSemenykhin/git-course-task/tree/task%231
- В истории комитов только три коммита(последние в оригинальной репе)
- В README файле описано как именно был произведен откат(Схема, описание или скрипт)
- Правки README файла могут быть 4м коммитом

```console
#!/bin/sh

git clone -b 'task#1' https://github.com/MaksymSemenykhin/git-course-task

cd git-course-task

p=`git lh | head -n 3 | tail -n 1`
cp=`git log --pretty=%h --reverse | tail -n 2`

echo git reset --hard $p
git reset --hard $p
echo git update-ref -d HEAD
git update-ref -d HEAD
echo git commit -m 'initial commit'
git commit -m 'initial commit'

for i in $cp
do
    echo git cherry-pick $i
    git  cherry-pick $i
done

echo >> README.md
echo '```console' >> README.md
cat ../$0 >> README.md
echo '```' >> README.md

git add README.md
git status
git commit -m 'update README.md'
```
