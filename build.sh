#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# 初回のみ superuser を作成。既に存在する場合はエラーを無視して継続
# 認証情報は環境変数 DJANGO_SUPERUSER_USERNAME / _EMAIL / _PASSWORD から読む
python manage.py createsuperuser --no-input || true
