FROM gentsotoes/ai-dev-env:1.0

# Update system and install core dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    git \
    build-essential \
    npm \
    gnupg \
    software-properties-common \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    libncurses5-dev \
    libffi-dev \
    liblzma-dev \
    python3 \
    python3-dev \
    python3-pip \
    net-tools \
    && python3 -m pip install --upgrade pip setuptools wheel

# Install Jupyter Lab and Python data science/AI libraries
RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir --ignore-installed \
    notebook jupyterlab \
    jupyterlab_code_formatter \
    ipywidgets \
    jupyterlab-git \
    jupyterlab-dash \
    matplotlib \
    seaborn \
    pandas \
    numpy \
    scikit-learn \
    tensorflow \
    keras \
    torch==2.0.1+cu117 \
    torchvision==0.15.2+cu117 \
    torchaudio==2.0.2+cu117 --extra-index-url https://download.pytorch.org/whl/cu117 \
    transformers \
    datasets \
    accelerate \
    cudf-cu11 --extra-index-url=https://pypi.nvidia.com \
    cuml-cu11 --extra-index-url=https://pypi.nvidia.com \
    fastapi \
    uvicorn \
    || true

# Add MongoDB's GPG key and repository
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/mongodb-keyring.gpg] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list \
    && apt-get update && apt-get install -y mongodb-org-shell

# Install Node.js, npm, and React tools
RUN apt-get remove -y libnode-dev nodejs \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g create-react-app react-scripts pm2 yarn nodemon

# Expose Jupyter Lab
EXPOSE 8888

# Set up Jupyter Lab with Dynamic Port Mapping
ENV JUPYTER_PORT=8888
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=${JUPYTER_PORT} --no-browser --allow-root"]
