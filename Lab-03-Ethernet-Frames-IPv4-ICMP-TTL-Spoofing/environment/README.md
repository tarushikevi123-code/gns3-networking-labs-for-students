# Python virtual environment

The original lab setup creates a virtual environment with access to Ubuntu's system-installed Scapy package:

```bash
mkdir -p /root/lab2_frames_ip
cd /root/lab2_frames_ip
python3 -m venv --system-site-packages venv
source venv/bin/activate
```

The Dockerfile installs `python3-scapy` through Ubuntu packages. The `--system-site-packages` option makes that package available inside the virtual environment.

Run the scripts with the virtual environment's interpreter, as specified by the lab instructions. Raw packet transmission requires the relevant raw-socket capability/permissions and should only be performed on the assigned isolated lab network.
