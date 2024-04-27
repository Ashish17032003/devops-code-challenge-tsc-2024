FROM python:3.10
WORKDIR /workspace
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY server ./server
EXPOSE 3000
ENV DB_HOST postgres
ENV DB_PORT 5439
ENV DB_DATABASE cern
ENV DB_USERNAME tech_user
ENV DB_PASSWORD postgres
# CMD ["uvicorn", "server.main:app"]
CMD ["uvicorn", "server.main:app", "--host", "0.0.0.0", "--port", "3000"]