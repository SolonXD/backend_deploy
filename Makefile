IP_ADDR = $(shell ip -o -4 addr list wlan0 | awk '{print $$4}' | cut -d/ -f1)

migrations:
	python task5/manage.py makemigrations
	python task5/manage.py migrate

build:
	pip install -r requirements.txt
	make migrations

run-specific:
	python task5/manage.py runserver $(IP_ADDR):8001

run:
	python task5/manage.py runserver 0:8000
