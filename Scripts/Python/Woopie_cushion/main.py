from flask import Flask, render_template, redirect
import pygame
import os

print("test")

app = Flask(__name__)

__location__ = os.path.realpath(
    os.path.join(
        os.getcwd(),
        os.path.dirname(
            __file__
        )
    )
)
fartFile = __location__ + '\\fart.wav'

# Initialize pygame mixer
pygame.mixer.init()

# Define route for index page
@app.route('/')
def index():
    return render_template('index.html')

# Define route for about page
@app.route('/about')
def about():
    return render_template('about.html')

# Define route for playing the fart sound
@app.route('/fart')
def fart():
    # Load and play the fart sound
    fart_sound = pygame.mixer.Sound(fartFile)
    fart_sound.play()
    return redirect("/")

#if __name__ == '__main__':
#    # Run the app on the Raspberry Pi's IP address on port 5000
#    app.run(host='0.0.0.0', port=5000, debug=True)

print("test")
app.run(host='0.0.0.0', port=5000, debug=True)