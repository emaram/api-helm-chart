from flask import Flask, jsonify
import socket

app = Flask(__name__)

@app.route('/')
def index():
    return "OK", 200

@app.route('/health')
def health():
    return jsonify(status="OK")

@app.route('/hello')
def hello():
    try:
        hostname = socket.gethostname()
        ip_address = socket.gethostbyname(hostname)
        return jsonify(message="Hello from Flask!", hostname=hostname, ip_address=ip_address)
    except socket.error as e:
        return jsonify(error=str(e)), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)