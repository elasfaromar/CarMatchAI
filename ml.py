import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from typing import List, Tuple
import data_util
from time import sleep
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class DBChangeHandler(FileSystemEventHandler):
    def __init__(self, file_path, n, callback):
        self.file_path = file_path
        self.n = n
        self.callback = callback
        self.change_count = 0

    def on_modified(self, event):
        if event.src_path == self.file_path:
            self.change_count += 1
            print(f"The file {self.file_path} has been modified ({self.change_count}/{self.n} changes).")
            if self.change_count == self.n:
                print(f"{self.n} changes detected. Executing callback.")
                self.callback()
                self.change_count = 0  # Reset the counter if you want to keep monitoring.


def watch_db(file_path: str, n: int, callback) -> None:
    event_handler = DBChangeHandler(file_path, n, callback)
    observer = Observer()
    observer.schedule(event_handler, path=file_path, recursive=False)
    observer.start()

    try:
        while True:
            sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

def execute() -> None:
    full_data = data_util.get_full_data()
    rand_data = data_util.get_sample_data()

    rand_df = pd.DataFrame(rand_data, columns=data_util.get_cols())
    print(rand_df)
    print(rand_df.columns)
    lm_df = rand_df.drop(columns=['Name', 'Photo'])

    xs = lm_df[['Year', 'Hp', 'isSUV', 'Seats', 'Gas', 'Length (mm)', 'Width (mm)', 'Height (mm)', 'MSRP (USD)', 'Reliability']]
    y = lm_df[['Score']]
    
    xs_train, _, y_train, _ = train_test_split(xs, y, test_size=0.2)

    lr = LinearRegression()
    lr.fit(xs_train, y_train)

    get_top_cars(lr, full_data)

    data_util.update_scores(full_data)

def get_top_cars(lr: LinearRegression, full_data: List[Tuple[float]]) -> None:
    intercept = lr.intercept_.tolist()[0]
    coefs = lr.coef_.tolist()[0]
    offset = 1

    for car in full_data:
        score = intercept
        for i in range(len(car)-3):
            score += coefs[i] * car[i+offset]

        car[data_util.cols_map.get('Score')] = score

if __name__ == "__main__":
    db_file = "cars.db"
    n_changes = 10

    watch_db(db_file, n_changes, execute)