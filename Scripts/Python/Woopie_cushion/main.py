from flask import Flask, render_template, redirect
import random
import pygame
import os

app = Flask(__name__)

# Set '__location__' variable to directory of script
__location__ = os.path.realpath(
    os.path.join(
        os.getcwd(),
        os.path.dirname(
            __file__
        )
    )
)

# Set variables to the script location + fileName
fartFile1 = __location__ + '\\fart.wav'
fartFile2 = __location__ + '\\fart2.wav'
fartFile3 = __location__ + '\\fart3.wav'


# Initialize pygame mixer
pygame.mixer.init()

# Define route for index page
@app.route('/')
def index():
    return render_template('index.html')

# Define route for playing the fart sound
@app.route('/fart')
def fart():
    # Load and play the fart sound
    fart_sounds = [fartFile1, fartFile2, fartFile3]
    random_fart_sound = random.choice(fart_sounds)
    fart_sound = pygame.mixer.music.load(random_fart_sound)
    fart_sound.play()
    # Redirect back to the root directory
    return redirect("/")

# Run the app
app.run(host='0.0.0.0', port=5000, debug=True)