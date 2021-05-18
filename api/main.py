import requests
from pynput import keyboard

urla = 'http://localhost:8080/input/a'
urlb = 'http://localhost:8080/input/d'

print('flipper da direita: d\nflipper da esquerda a\n')

while(True):
    with keyboard.Events() as events:
        event = events.get(1e6)
        if event.key == keyboard.KeyCode.from_char('a'):
            requests.post(urla)
        if event.key == keyboard.KeyCode.from_char('d'):
            requests.post(urlb)
