import requests
from pynput import keyboard

url = ''
urla = '/input/a'
urlb = '/input/d'

print('passe a url:')

url = input()

print('flipper da direita: d\nflipper da esquerda a\n')

while(True):
    with keyboard.Events() as events:
        event = events.get(1e6)
        if event.key == keyboard.KeyCode.from_char('a'):
            requests.post(url+urla)
        if event.key == keyboard.KeyCode.from_char('d'):
            requests.post(url+urlb)
