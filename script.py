import iris

def main():
 
  connection_string = "localhost:1972/SAMPLES" #change connection_string details with the correct Host, Port and Namespace
  username = "superuser"
  password = "SYS"

  connection = iris.connect(connection_string, username, password)
  cursor = connection.cursor()

  try:
        # Execute a SELECT query
        cursor.execute("SELECT * FROM Sample.Company")
        
        # Fetch the results
        for row in cursor.fetchall():
            print("ID: {}, Mission: {}, Name: {}, Revenue: {}, TaxID: {}".format(row[0], row[1], row[2], row[3], row[4]))
  
  except Exception as ex:
    print(ex)
  finally:
    if cursor:
      cursor.close()
    if connection:
      connection.close()

if __name__ == "__main__":
  main()
