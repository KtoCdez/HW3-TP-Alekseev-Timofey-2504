import csv
import random
import os
import sys

NUM_ROWS = 50

# Придумываем колонки для джедаев
COLUMNS = ["Jedi_Name", "Midichlorian_Count", "Force_Strange", "Lightsaber_Color"]

def generate_row():

    return {
        "Jedi_Name": random.choice(["Anakin Skywalker", "Luke Skywalker", "Obi-Wan Kenobi", "Yoda", "Mace Windu", "Qui-Gon Jinn", "Ahsoka Tano"]),
        "Midichlorian_Count": random.randint(7000, 20000),
        "Force_Strange": round(random.uniform(1.0, 10.0), 2),
        "Lightsaber_Color": random.choice(["Blue", "Green", "Purple", "Yellow"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)