# CogniVibe AI Development Environment

This document outlines the architecture, design, and operational guidelines for setting up and maintaining the CogniVibe AI development environment. The environment leverages Docker containers for consistency, scalability, and reproducibility. Below are the finalized instructions, configurations, and best practices uncovered during development.

---

## **Architecture Overview**

### **Components**
1. **Docker Container**:
   - Base Image: `gentsotoes/ai-dev-env:1.0`
   - Updated Image: `gentsotoes/cognivibe-ai-lab:2.0`

2. **Key Dependencies**:
   - Python Libraries:
     - Data Science: `numpy`, `pandas`, `matplotlib`, `seaborn`
     - Machine Learning: `scikit-learn`, `tensorflow`, `torch`, `transformers`
     - FastAPI for web APIs: `fastapi`, `uvicorn`
   - Node.js and React Tools:
     - `create-react-app`, `react-scripts`, `pm2`, `nodemon`, `yarn`
   - MongoDB Client Tools

3. **Dynamic Port Mapping**:
   - The container dynamically maps its internal `8888` port to an available host port.
   - Environment variable `JUPYTER_PORT` allows flexible port assignments.

4. **Persistent Configuration**:
   - `Dockerfile`
   - `requirements.txt`

---

## **Setup Instructions**

### **Dockerfile Configuration**
The Dockerfile is the foundation of the environment. Below is the final configuration:

```dockerfile
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

# Set up Jupyter Lab with dynamic port mapping
ENV JUPYTER_PORT=8888
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=${JUPYTER_PORT} --no-browser --allow-root"]
```

### **Requirements File**
The `requirements.txt` file ensures all necessary Python dependencies are installed:

```plaintext
--extra-index-url https://download.pytorch.org/whl/cu117
torch==2.0.1+cu117
torchvision==0.15.2+cu117
torchaudio==2.0.2+cu117
tensorflow
transformers
datasets
accelerate
cudf-cu11 --extra-index-url=https://pypi.nvidia.com
cuml-cu11 --extra-index-url=https://pypi.nvidia.com
scikit-learn
pandas
numpy
matplotlib
seaborn
fastapi
uvicorn
jupyterlab
notebook
jupyterlab_code_formatter
ipywidgets
jupyterlab-git
jupyterlab-dash
flask
flask-cors
```

---

## **Workflow**

### **Build and Run the Container**
1. **Build the Docker Image**:
   ```bash
   docker build -t gentsotoes/cognivibe-ai-lab:2.0 ~/docker-projects/cognivibe-ai-lab
   ```

2. **Run the Container Dynamically**:
   ```bash
   docker run -it --rm --gpus all -P -v ~/docker-projects/cognivibe-ai-lab:/workspace gentsotoes/cognivibe-ai-lab:2.0
   ```

3. **Find the Assigned Port**:
   ```bash
   docker ps
   ```
   Use the dynamically assigned port to access Jupyter Lab in your browser.

   Example:
   ```
   http://localhost:<dynamic_port>
   ```

---

## **Best Practices**
1. **Dynamic Port Mapping**:
   - Use `-P` to avoid port conflicts.
   - Verify the assigned port using `docker ps`.

2. **Version Control**:
   - Commit updates to the `Dockerfile` and `requirements.txt` regularly.
   - Use meaningful tags for Docker images (e.g., `2.0`, `latest`).

3. **Testing**:
   - Test the environment after every build.
   - Validate installed dependencies with `pip list` and other tools.

---

### **Repository Links**
- **GitHub**: [CogniVibe AI Lab](https://github.com/DredgeMonkey/AiLab)
- **Docker Hub**: [CogniVibe AI Lab](https://hub.docker.com/repository/docker/gentsotoes/cognivibe-ai-lab)

---

For further assistance, contact the development team or refer to this document for troubleshooting steps.

