# Dockerfile
FROM yanwk/comfyui-boot:cu124-slim

# ensure git is available
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/*

# install Manager's Python dependencies
RUN pip install --no-cache-dir -r /root/ComfyUI/custom_nodes/ComfyUI-Manager/requirements.txt

# expose the default ComfyUI port
EXPOSE 8188

# default entrypoint (listens on all interfaces by default)
CMD ["python3", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
