FROM python

RUN mkdir /api
WORKDIR /api
COPY . .

RUN pip install -r requirements.txt
ENV FASTAPI_ENV=test

EXPOSE 8000

ENTRYPOINT ["coverage", "run", "-m", "uvicorn", "src.main:app"]
