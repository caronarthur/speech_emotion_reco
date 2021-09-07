FROM python:3.8.6-buster

COPY api /api
COPY models /models
COPY samples /samples
#COPY speech_emotion_reco/encoder /speech_emotion_reco/encoder
COPY speech_emotion_reco/__init__.py /speech_emotion_reco/__init__.py
COPY speech_emotion_reco/combine_models.py /speech_emotion_reco/combine_models.py
COPY speech_emotion_reco/data.py /speech_emotion_reco/data.py
COPY speech_emotion_reco/gcp.py /speech_emotion_reco/gcp.py
COPY speech_emotion_reco/mateo_preprocess.py /speech_emotion_reco/mateo_preprocess.py
COPY speech_emotion_reco/params.py /speech_emotion_reco/params.py
COPY speech_emotion_reco/raph_data.py /speech_emotion_reco/raph_data.py


COPY requirements.txt /requirements.txt
#COPY model.joblib /model.joblib
#COPY /home/mateo/code/mlorantdourte/gcp/le-wagon-data-mateo.json /credentials.json

RUN pip install -r requirements.txt

CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT