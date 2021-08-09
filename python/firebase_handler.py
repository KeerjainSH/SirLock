from time import time
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import threading
import time
import RPi.GPIO as GPIO
from subprocess import call
import pygame

credential = credentials.Certificate('raspberry-pi-img-b3fb9-42bd11335a1c.json')
firebase_admin.initialize_app(credential, {
  'projectId': 'raspberry-pi-img-b3fb9',
})

database = firestore.client()

# Create an Event for notifying main thread.
callback_done = threading.Event()

def run_command(command):
  if command == 0:
    return
  # Shutdown
  elif command == 1:
    call("sudo nohup shutdown -h now", shell=True)
  # Reboot
  elif command == 2:
    call("sudo nohup shutdown -r now", shell=True)
  # Sound Alarm
  elif command == 3:
    pygame.mixer.init()
    pygame.mixer.music.load("Alarm.mp3")
    pygame.mixer.music.set_volume(1.0)
    pygame.mixer.music.play()
  # Lock Door
  elif command == 4:
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(17, GPIO.OUT)

    GPIO.output(17, 1)
    time.sleep(10)
    GPIO.output(17, 0)
    GPIO.cleanup()

# Create a callback on_snapshot function to capture changes
def on_snapshot(doc_snapshot, changes, read_time):
  for doc in doc_snapshot:
    doc_dict = doc.to_dict()
    if 'command' in doc_dict:
      run_command(doc_dict['command'])
      database.collection(u'commands').document(u'0Ufqy1OUZ4QUadL1hmkl').update({'command': 0})

  callback_done.set()

doc_ref = database.collection(u'commands').document(u'0Ufqy1OUZ4QUadL1hmkl')

# Get data On Start
doc = doc_ref.get()
if doc.exists:
  doc_dict = doc.to_dict()
  if 'command' in doc_dict:
    run_command(doc_dict['command'])
    database.collection(u'commands').document(u'0Ufqy1OUZ4QUadL1hmkl').update({'command': 0})

# Listener
doc_watch = doc_ref.on_snapshot(on_snapshot)

# Watch the document
while True:
  time.sleep(1)
