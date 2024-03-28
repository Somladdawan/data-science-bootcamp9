from requests import get
from time import sleep

url = "https://swapi.py4e.com/api/people/"

for i in range(5):
  index = i + 1  
  new_url = url + str(index)
  resp = get(new_url).json()
  name = resp["name"]
  height = resp["height"]
  print(name, height)
  sleep(2)
