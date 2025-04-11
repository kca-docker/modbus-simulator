ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/opt
ARG APP=pymodbus
ARG APPFOLDER=${BASEFOLDER}/${APP}




FROM ${IMAGE}
ARG APPFOLDER

WORKDIR ${APPFOLDER}

COPY requirements.txt .
RUN pip install --no-cache \
                --root-user-action ignore \
                -r requirements.txt \
&&  rm requirements.txt

## Copy template script(s) to image 
COPY *.py .

## Define entrypoint with default arg: python example.py
ENTRYPOINT ["python", "simulator.py"]
CMD [""]
