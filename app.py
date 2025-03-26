from flask import Flask, request, jsonify, send_file, render_template
from flask_cors import CORS  # import CORS
from gtts import gTTS
import os

app = Flask(__name__)
CORS(app)  # enable CORS for all routes


@app.route('/')
def index():
    return render_template("index.html")


@app.route('/generate-audio', methods=['POST'])
def generate_audio():
    data = request.get_json()
    text = data.get('text', '')
    language = data.get('language', 'en')
    slow = data.get('slow', False)
    fast = data.get('fast', False)  # new parameter to specify fast speech
    
    if text:
        # If fast is True, set slow to False, which generates faster speech
        tts_speed = False if fast else slow
        tts = gTTS(text=text, lang=language, slow=tts_speed)
        audio_file_path = 'output.mp3'
        tts.save(audio_file_path)
        return send_file(audio_file_path, as_attachment=True)
    
    return jsonify({"error": "No text provided"}), 400

if __name__ == '__main__':
    app.run(debug=True)
