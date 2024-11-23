from typing import List, Tuple
import sqlite3

cols_map = {
    "Name": 0, "Year": 1, "Hp": 2, "isSUV": 3, "Seats": 4, "Gas": 6, "Length (mm)": 7, "Width (mm)": 8, "Height (mm)": 9, "MSRP (USD)": 10, "Reliability": 11, "Score": 12, "Photo": 13
}

def get_cols() -> List[str]: 
    return list(cols_map.keys()) 

def get_data(query) -> List[Tuple[float]]:
    try:
        # Connect to DB and create a cursor
        sqliteConnection = sqlite3.connect('cars.db')
        cursor = sqliteConnection.cursor()
        print('DB Accessed')

        # Write a query and execute it with cursor
        cursor.execute(query)

        # Fetch and output result
        result = cursor.fetchall()
        print('Data Fetched')

        for i in range(len(result)):
            result[i] = list(result[i])

        # Close the cursor
        cursor.close()

    # Handle errors
    except sqlite3.Error as error:
        print('Error occurred - ', error)

    # Close DB Connection irrespective of success or failure
    finally:
        if sqliteConnection:
            sqliteConnection.close()
            print('SQLite Connection closed')

    return result

def get_full_data() -> List[List[float]]: 
    return get_data('SELECT * FROM cars;')

def get_sample_data() -> List[List[float]]: 
    return get_data('SELECT * FROM cars WHERE score IS NOT NULL;')

def update_scores(full_data: List[List[float]]) -> None:
    try:
        # Connect to the database and create a cursor
        sqliteConnection = sqlite3.connect('cars.db')
        cursor = sqliteConnection.cursor()

        for x in full_data:
            name = x[cols_map["Name"]]
            score = x[cols_map["Score"]]

            # Ensure score is a number and name is a string
            query = f'UPDATE cars SET score = ? WHERE name = ?;'
            cursor.execute(query, (score, name))
            print(f'DB Updated: {name} with Score: {score}')

        # Commit changes to persist them
        sqliteConnection.commit()

    # Handle errors
    except sqlite3.Error as error:
        print('Error occurred - ', error)

    # Close DB Connection irrespective of success
    # or failure
    finally:
        if sqliteConnection:
            sqliteConnection.close()
            print('SQLite Connection closed')

