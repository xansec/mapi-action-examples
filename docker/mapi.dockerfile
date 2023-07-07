FROM python

RUN mkdir /api
WORKDIR /api
COPY . .

RUN pip install -r requirements.txt
ENV FASTAPI_ENV=test

EXPOSE 8000

RUN mkdir /coverage

ENTRYPOINT ["coverage", "run", "--data-file=/coverage/coverage.xml", "-m", "uvicorn", "src.main:app"]
