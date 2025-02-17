FROM python:3.7

RUN pip install virtualenv

ENV VIRTUAL_ENV=/venv
RUN virtualenv $VIRTUAL_ENV -p python3
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt

ENV PORT 8080

CMD ["gunicorn", "app:app", "--config=config.py"]